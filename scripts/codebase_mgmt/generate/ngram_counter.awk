BEGIN {
    RS = ""; # Read whole file as one record
    FS = "[[:space:]]+"; # Split by whitespace
}
{
    for (i=1; i<=NF; i++) {
        if (i + n - 1 <= NF) {
            gram = "";
            for (j=0; j<n; j++) {
                gram = gram (j==0 ? "" : " ") $ (i+j);
            }
            counts[gram]++;
        }
    }
}
END {
    first = 1;
    for (gram in counts) {
        if (!first) printf ",";
        printf "\"%s\": %d", gram, counts[gram];
        first = 0;
    }
}