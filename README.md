# KodeKloud-scrapper


execute script from master:
                           
                           POD NAME

kubectl exec -it scrapper-deployment-f7d54b448-vzksk -- python3 scrapper_v1.py


execute script in pod container:

                     POD CONTAINER NAME
kubectl exec -it scrapper-deployment-54c49f748f-cjjg5 -- bash

python3 scrapper_v1.py &

tail -f /tmp/scrapper.log
