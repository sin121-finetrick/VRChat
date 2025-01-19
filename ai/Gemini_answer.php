<?php

$apiKey = getenv('GEMINI_API_KEY');
if ($apiKey === false) {
    die('GEMINI_API_KEY environment variable not set');
}
$url = 'https://generativelanguage.googleapis.com/v1beta2/models/gemini-pro:generateContent?key=' . $apiKey; // Gemini Proのendpoint

$data = [
    'contents' => [
        [
            'parts' => [
                ['text' => 'こんにちは。']
            ]
        ]
    ]
];

$options = [
    'http' => [
        'method' => 'POST',
        'header' => [
            'Content-Type: application/json',
        ],
        'content' => json_encode($data),
    ],
];

$context = stream_context_create($options);
$result = file_get_contents($url, false, $context);

if ($result === FALSE) {
    die("Error fetching data");
}

$response = json_decode($result, true);

if (isset($response['candidates'][0]['content']['parts'][0]['text'])) {
    echo $response['candidates'][0]['content']['parts'][0]['text'];
} else {
        error_log(print_r($response, true)); // エラー内容をログに出力
    echo "レスポンス形式が不正です。";
}

?>