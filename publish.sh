ver=$(awk -F '[.-]' 'NR==1{ print $1"."$2"."$3 }' version.txt)
echo $ver

echo $ver > version.txt
git commit -am "Release $ver"
git tag $ver

rm dist/*
python3 setup.py sdist bdist_wheel
twine upload dist/* -r pypi

cat version.txt

nextVersion=$(awk -F '[.-]' 'NR==1{ print $1"."$2"."($3 + 1) }' version.txt)
echo "${nextVersion}-SNAPSHOT" > version.txt
git commit -am "Next version"

git push
git push --tags