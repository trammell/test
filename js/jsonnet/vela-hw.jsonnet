# jsonnet template to generate the standard Vela hello world example
local a = {
    version: 1,
    steps: [
        {
            name: "hw",
            image: 'golang:1.13',
            commands: [
                'echo "hello world"'
            ],
        },
    ]    
};

[a]


// steps:
//   - name: build-binary
//     image: golang:1.13
//     environment:
//       CGO_ENABLED: 0
//       USERNAME: z004h51
//     commands:
//       - echo "helloo $USERNAME"
//       - go build -o release/hello-world
//       - ./release/hello-world "${BUILD_AUTHOR}"
//       - start_time=$(date +%s)
//       - echo "1" >> /tmp/build_main_status.txt
//       - end_time=$(date +%s)
//       - echo $((end_time - start_time)) >> $BUILD_METRICS_HOME/build_main_time.txt

//   - name: restore_cache
// #    image: docker.target.com/vela-plugins/s3-cache:v0.3.0-1
//     image: docker.target.com/johntrammell/vela-s3-cache-tram:latest
//     pull: true
//     parameters:
//       action: restore

