# KodeKloud-scrapper


execute script in pod container:

                     POD CONTAINER NAME
kubectl exec -it scrapper-deployment-54c49f748f-cjjg5 -- bash
python3 scrapper_v1.py &
tail -f /tmp/scrapper.log
