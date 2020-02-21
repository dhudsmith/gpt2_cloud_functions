import gc
import os
import sys

logfile = '/dev/std_writes.txt'

# overcome stdout/stderr writing errors by shunting writes to a file.
with open(logfile, 'w') as f:
    orig_stdout = sys.stdout
    orig_stderr = sys.stderr
    sys.stdout = f
    sys.stderr = f

    # suppress tensorflow warnings (not being caught by stderr or stdout)
    os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

    # load gpt2 model and start session
    import gpt_2_simple as gpt2
    wd = os.getcwd()
    checkpoint_dir = wd+"/../../../" + "checkpoint"
    sess = gpt2.start_tf_sess(threads=1)
    gpt2.load_gpt2(sess, checkpoint_dir=checkpoint_dir)

    # reset stdout
    sys.stdout = orig_stdout
    sys.stderr = orig_stderr

# get_startup_log as string
with open(logfile, 'r') as f:
    log_str = f.read()


# main function to generate text
def main(params):
    """
    length: number of generated tokens
    temperature: higher values lead to sampling more from less probable tokens
    top_k: restrict to top-k tokens
    top_p: TODO
    prefix: start words to seed text generation
    truncate: TODO
    include_prefix: TODO
    """
    global generate_count
    global sess

    text = gpt2.generate(sess,
                         checkpoint_dir=checkpoint_dir,
                         length=int(params.get('length', 100)),
                         temperature=float(params.get('temperature', 0.7)),
                         top_k=int(params.get('top_k', 0)),
                         top_p=float(params.get('top_p', 0)),
                         prefix=params.get('prefix', '')[:500],
                         truncate=params.get('truncate', None),
                         include_prefix=str(params.get(
                             'include_prefix', True)).lower() == 'true',
                         return_as_list=True
                         )[0]

    gc.collect()

    return {
        'body': {
            'text': text,
            'std_writes': log_str
        }
    }
