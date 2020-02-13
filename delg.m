function delg=delg(w)
for i=1:numel(w)
    if w(i)>=0
        delg(i,1)=1;
    else
        delg(i,1)=-1;
    end
end