docker build . -f dockerfiles/Dockerfile_debate -t dhudsmith/gpt2:debate
docker push dhudsmith/gpt2:debate
ibmcloud fn action update gpt2_gen_debate gpt2_nlg_fn.py --docker dhudsmith/gpt2:debate --memory 2048 --timeout 600000 --web true

docker build . -f dockerfiles/Dockerfile_elon -t dhudsmith/gpt2:elon
docker push dhudsmith/gpt2:elon
ibmcloud fn action update gpt2_gen_elon gpt2_nlg_fn.py --docker dhudsmith/gpt2:elon --memory 2048 --timeout 600000 --web true

docker build . -f dockerfiles/Dockerfile_jokes -t dhudsmith/gpt2:jokes
docker push dhudsmith/gpt2:jokes
ibmcloud fn action update gpt2_gen_jokes gpt2_nlg_fn.py --docker dhudsmith/gpt2:jokes --memory 2048 --timeout 600000 --web true

docker build . -f dockerfiles/Dockerfile_lyrics -t dhudsmith/gpt2:lyrics
docker push dhudsmith/gpt2:lyrics
ibmcloud fn action update gpt2_gen_lyrics gpt2_nlg_fn.py --docker dhudsmith/gpt2:lyrics --memory 2048 --timeout 600000 --web true

docker build . -f dockerfiles/Dockerfile_qtmovies -t dhudsmith/gpt2:qtmovies
docker push dhudsmith/gpt2:qtmovies
ibmcloud fn action update gpt2_gen_qtmovies gpt2_nlg_fn.py --docker dhudsmith/gpt2:qtmovies --memory 2048 --timeout 600000 --web true

docker build . -f dockerfiles/Dockerfile_small -t dhudsmith/gpt2:small
docker push dhudsmith/gpt2:small
ibmcloud fn action update gpt2_gen_small gpt2_nlg_fn.py --docker dhudsmith/gpt2:small --memory 2048 --timeout 600000 --web true

docker build . -f dockerfiles/Dockerfile_trump -t dhudsmith/gpt2:trump
docker push dhudsmith/gpt2:trump
ibmcloud fn action update gpt2_gen_trump gpt2_nlg_fn.py --docker dhudsmith/gpt2:trump --memory 2048 --timeout 600000 --web true

docker build . -f dockerfiles/Dockerfile_tyson -t dhudsmith/gpt2:tyson
docker push dhudsmith/gpt2:tyson
ibmcloud fn action update gpt2_gen_tyson gpt2_nlg_fn.py --docker dhudsmith/gpt2:tyson --memory 2048 --timeout 600000 --web true