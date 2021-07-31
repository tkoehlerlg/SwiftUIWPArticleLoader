//
//  ContentfulArticle.swift
//  
//
//  Created by Torben Köhler on 26.07.21.
//

import Foundation

struct ContentfulArticle: Decodable, Identifiable {
    // Top Data
    let id: Int
    let date: String
    let slug: String
    let title: Content
    let link: URL
    let categories: [Int]
    let type: String
    let status: String

    // Content
    let content: String
    let excerpt: String

    // Em
    embeddedData: 

    // Media
}

let myDictionary: [String : Any] = [
    "author" : 2,
    "featured_media" : 1183,
    "comment_status" : "open",
    "ping_status" : "open",
    "sticky" : false,
    "template" : "",
    "format" : "standard",
    "meta" : [],
    "categories" : [
        8
    ],
    "tags" : [],
    "blocksy_meta" : [
        "styles_descriptor" : [
            "styles" : [
                "desktop" : "",
                "tablet" : "",
                "mobile" : ""
            ],
            "google_fonts" : []
        ]
    ],
    "_links" : [
        "self" : [
            [
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/posts/1182"
            ]
        ],
        "collection" : [
            [
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/posts"
            ]
        ],
        "about" : [
            [
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/types/post"
            ]
        ],
        "author" : [
            [
                "embeddable" : true,
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/users/2"
            ]
        ],
        "replies" : [
            [
                "embeddable" : true,
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/comments?post=1182"
            ]
        ],
        "version-history" : [
            [
                "count" : 3,
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/posts/1182/revisions"
            ]
        ],
        "predecessor-version" : [
            [
                "id" : 1295,
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/posts/1182/revisions/1295"
            ]
        ],
        "wp:featuredmedia" : [
            [
                "embeddable" : true,
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/media/1183"
            ]
        ],
        "wp:attachment" : [
            [
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/media?parent=1182"
            ]
        ],
        "wp:term" : [
            [
                "taxonomy" : "category",
                "embeddable" : true,
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/categories?post=1182"
            ],
            [
                "taxonomy" : "post_tag",
                "embeddable" : true,
                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/tags?post=1182"
            ]
        ],
        "curies" : [
            [
                "name" : "wp",
                "href" : "https://api.w.org/{rel}",
                "templated" : true
            ]
        ]
    ],
    "_embedded" : [
        "author" : [
            [
                "id" : 2,
                "name" : "Torben Köhler",
                "url" : "",
                "description" : "",
                "link" : "https://eierml.ml-projects.de/author/torben/",
                "slug" : "torben",
                "avatar_urls" : [
                    "24" : "https://secure.gravatar.com/avatar/73979a20f60b10dc83607cd217879a53?s=24&d=mm&r=g",
                    "48" : "https://secure.gravatar.com/avatar/73979a20f60b10dc83607cd217879a53?s=48&d=mm&r=g",
                    "96" : "https://secure.gravatar.com/avatar/73979a20f60b10dc83607cd217879a53?s=96&d=mm&r=g"
                ],
                "_links" : [
                    "self" : [
                        [
                            "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/users/2"
                        ]
                    ],
                    "collection" : [
                        [
                            "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/users"
                        ]
                    ]
                ]
            ]
        ],
        "wp:featuredmedia" : [
            [
                "id" : 1183,
                "date" : "2021-07-17T19:51:10",
                "slug" : "filip-andrejevic-qmx5lw8stoq-unsplash",
                "type" : "attachment",
                "link" : "https://eierml.ml-projects.de/projekt-start/filip-andrejevic-qmx5lw8stoq-unsplash/",
                "title" : [
                    "rendered" : "filip-andrejevic-QmX5lw8StoQ-unsplash"
                ],
                "author" : 2,
                "caption" : [
                    "rendered" : ""
                ],
                "alt_text" : "",
                "media_type" : "image",
                "mime_type" : "image/jpeg",
                "media_details" : [
                    "width" : 2560,
                    "height" : 1707,
                    "file" : "2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-scaled.jpg",
                    "sizes" : [
                        "medium" : [
                            "file" : "filip-andrejevic-QmX5lw8StoQ-unsplash-300x200.jpg",
                            "width" : 300,
                            "height" : 200,
                            "mime_type" : "image/jpeg",
                            "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-300x200.jpg"
                        ],
                        "large" : [
                            "file" : "filip-andrejevic-QmX5lw8StoQ-unsplash-1024x683.jpg",
                            "width" : 1024,
                            "height" : 683,
                            "mime_type" : "image/jpeg",
                            "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-1024x683.jpg"
                        ],
                        "thumbnail" : [
                            "file" : "filip-andrejevic-QmX5lw8StoQ-unsplash-150x150.jpg",
                            "width" : 150,
                            "height" : 150,
                            "mime_type" : "image/jpeg",
                            "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-150x150.jpg"
                        ],
                        "medium_large" : [
                            "file" : "filip-andrejevic-QmX5lw8StoQ-unsplash-768x512.jpg",
                            "width" : 768,
                            "height" : 512,
                            "mime_type" : "image/jpeg",
                            "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-768x512.jpg"
                        ],
                        "1536x1536" : [
                            "file" : "filip-andrejevic-QmX5lw8StoQ-unsplash-1536x1024.jpg",
                            "width" : 1536,
                            "height" : 1024,
                            "mime_type" : "image/jpeg",
                            "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-1536x1024.jpg"
                        ],
                        "2048x2048" : [
                            "file" : "filip-andrejevic-QmX5lw8StoQ-unsplash-2048x1365.jpg",
                            "width" : 2048,
                            "height" : 1365,
                            "mime_type" : "image/jpeg",
                            "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-2048x1365.jpg"
                        ],
                        "full" : [
                            "file" : "filip-andrejevic-QmX5lw8StoQ-unsplash-scaled.jpg",
                            "width" : 2560,
                            "height" : 1707,
                            "mime_type" : "image/jpeg",
                            "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-scaled.jpg"
                        ]
                    ],
                    "image_meta" : [
                        "aperture" : "0",
                        "credit" : "",
                        "camera" : "",
                        "caption" : "",
                        "created_timestamp" : "0",
                        "copyright" : "",
                        "focal_length" : "0",
                        "iso" : "0",
                        "shutter_speed" : "0",
                        "title" : "",
                        "orientation" : "0",
                        "keywords" : []
                    ],
                    "original_image" : "filip-andrejevic-QmX5lw8StoQ-unsplash.jpg"
                ],
                "source_url" : "https://eierml.ml-projects.de/wp-content/uploads/2021/07/filip-andrejevic-QmX5lw8StoQ-unsplash-scaled.jpg",
                "_links" : [
                    "self" : [
                        [
                            "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/media/1183"
                        ]
                    ],
                    "collection" : [
                        [
                            "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/media"
                        ]
                    ],
                    "about" : [
                        [
                            "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/types/attachment"
                        ]
                    ],
                    "author" : [
                        [
                            "embeddable" : true,
                            "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/users/2"
                        ]
                    ],
                    "replies" : [
                        [
                            "embeddable" : true,
                            "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/comments?post=1183"
                        ]
                    ]
                ]
            ]
        ],
        "wp:term" : [
            [
                [
                    "id" : 8,
                    "link" : "https://eierml.ml-projects.de/category/projekt-start/",
                    "name" : "Projekt Start",
                    "slug" : "projekt-start",
                    "taxonomy" : "category",
                    "_links" : [
                        "self" : [
                            [
                                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/categories/8"
                            ]
                        ],
                        "collection" : [
                            [
                                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/categories"
                            ]
                        ],
                        "about" : [
                            [
                                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/taxonomies/category"
                            ]
                        ],
                        "wp:post_type" : [
                            [
                                "href" : "https://eierml.ml-projects.de/wp-json/wp/v2/posts?categories=8"
                            ]
                        ],
                        "curies" : [
                            [
                                "name" : "wp",
                                "href" : "https://api.w.org/{rel}",
                                "templated" : true
                            ]
                        ]
                    ]
                ]
            ],
            []
        ]
    ]
]
