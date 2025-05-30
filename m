Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uKyYH-0008E8-58
	for mharc-qemu-trivial@gnu.org; Fri, 30 May 2025 08:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyYG-0008Dk-6R
 for qemu-trivial@nongnu.org; Fri, 30 May 2025 08:09:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uKyYE-0004uw-0F
 for qemu-trivial@nongnu.org; Fri, 30 May 2025 08:09:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748606968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y36I0mm1fE8F59v3MNks+MQO5UzMqRoWnWNZcNkjuNY=;
 b=QV8yQXFjSfp+phLnArttaeI3OIFLR7Ph2IwzykAProe9zfIKifbfuYSCTcAB4LfMCE5d3r
 Ezk22WBy7xPJIKfGhjunWNP17QmBVpEG1+n5fGyjMOTTcbSUCnvm0TDtfGxsdsh1Mhlhph
 qscS1ARhEWM6Lw6ZMwM8rg1hZkK2BOU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-fPoTRI2yMUOXUtKVDul2Ag-1; Fri, 30 May 2025 08:09:27 -0400
X-MC-Unique: fPoTRI2yMUOXUtKVDul2Ag-1
X-Mimecast-MFC-AGG-ID: fPoTRI2yMUOXUtKVDul2Ag_1748606966
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4fac7fa27so142721f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 30 May 2025 05:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748606966; x=1749211766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y36I0mm1fE8F59v3MNks+MQO5UzMqRoWnWNZcNkjuNY=;
 b=Ih93rfHJgVczxpo2A8IqZ4A8ulnS3uEsC5+2yXeVvW+FVbh6WMtr1ey+ke+f96xcx4
 5P3Rgev0LTMZeQrQ0fX0WZdrMRphGtoazxALpXXPzM87/s8b1X8XzwuaWZaPm4NMAdTI
 i2WXfmkk0lLbadtRE4nUAazPXjlPOR2+AbLuMPx+yss9dC/AqepZej8zue7Psk+wXvGB
 2Tyr13+2TdDyaMpKgbwx69n+VtyVjxOkxFJ9XwyScHzyl2O7XVeLN8C1kfnyUP3KmVhY
 PCj02z9OZ+g9zsdIhBiQJzAOh2oYlDfMCGXQhHcnjytFKsdOwNzI+lNp5Q2sj5Hx5Mfj
 N7EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZJohi6Fn4XDPoV85j5IppeioD80nUB8N/s9Ez5oJ5jX+yt6inRTydfeVzRlJFz5CQtZUVST75N5iqaMo=@nongnu.org
X-Gm-Message-State: AOJu0YwJu68R+aF1+jCyMEdD0Qxx81SWkN2+4XNw8yTb1qY9bvRaojz9
 BWhmgfJzPGtaQ8eyLebJwCtSdp58qqrAlP2Z5Mga1BMM+DjkiUmVkOgBfS5+U2APpjNgFfACxsl
 xxD0fLlNiKybE8ePvd1/TQZ51KGqwaKuJzRr7fGLjVCjAd178iuMhvRjPQp4=
X-Gm-Gg: ASbGncveTSG3+8DahS2AvI8XJHuQ4rEJTihHfF7alvBi8OPBSf+YeEiw0PY7mzQHW/Q
 3Hl1dvWSs/wFidXD2cAzrBqoBA9h/arx9O9dSecugUEVd4CMsDdTKZCA9CywPQE+1otry86e0S7
 lfpdDH9cBZO7GQoqxFnSe3rWIe0Pf5Kq+o0b5qW4MJH4e1W9o/YvSDXt7rtZxAVsuluxTXNgXaZ
 SspYfhCaYD0ryKUwFKDk7OxgWCaCNbdfdr+b6tSxu71NFiQtC7krHLIyXNTga0DbaJ3LZJdyFab
 WkdZSQ==
X-Received: by 2002:a5d:64ed:0:b0:3a4:f72a:b19d with SMTP id
 ffacd0b85a97d-3a4f7a3baa5mr2364561f8f.8.1748606966338; 
 Fri, 30 May 2025 05:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHpmPiSVjIeMfszOTcwlCD8JLRILKP2Abehpiig7iFqcfCFQvkdj/a/1cBHrDo1Mhl0JtX0w==
X-Received: by 2002:a5d:64ed:0:b0:3a4:f72a:b19d with SMTP id
 ffacd0b85a97d-3a4f7a3baa5mr2364504f8f.8.1748606965837; 
 Fri, 30 May 2025 05:09:25 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4f00a00d4sm4694585f8f.92.2025.05.30.05.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 05:09:25 -0700 (PDT)
Date: Fri, 30 May 2025 08:09:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Jiri Pirko <jiri@resnulli.us>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>, Peter Xu <peterx@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-block@nongnu.org,
 Mads Ynddal <mads@ynddal.dk>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Fabiano Rosas <farosas@suse.de>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenwei Pi <pizhenwei@bytedance.com>, Ani Sinha <anisinha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v3 0/4] qapi: add auto-generated return docs
Message-ID: <20250530080853-mutt-send-email-mst@kernel.org>
References: <20250523182442.54469-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250523182442.54469-1-jsnow@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IrCd9P4U-JUYXf3fYOFJLDOzij5L2X5nyZvMuUfF2_A_1748606966
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.907,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 30 May 2025 12:09:32 -0000

On Fri, May 23, 2025 at 02:24:38PM -0400, John Snow wrote:
> v3: rebased on top of python-qapi-linting (v4) pull request;
>     removed commits that are no longer needed.
>     Markus: I forget where we left off... shall we refresh?
> 
> v2: fix multi-return-sections bug :(


LGTM
My bits:

Acked-by: Michael S. Tsirkin <mst@redhat.com>

feel free to merge


> John Snow (4):
>   docs/qapi-domain: add return-nodesc
>   docs, qapi: generate undocumented return sections
>   qapi: remove trivial "Returns:" sections
>   qapi: rephrase return docs to avoid type name
> 
>  docs/devel/qapi-domain.rst | 30 ++++++++++++++++++++++++++++++
>  docs/sphinx/qapi_domain.py |  8 ++++++++
>  docs/sphinx/qapidoc.py     | 14 ++++++++------
>  qapi/audio.json            |  2 --
>  qapi/block-core.json       | 14 +++-----------
>  qapi/block-export.json     |  2 +-
>  qapi/block.json            |  2 +-
>  qapi/char.json             |  8 --------
>  qapi/control.json          |  5 ++---
>  qapi/cryptodev.json        |  2 --
>  qapi/dump.json             |  5 ++---
>  qapi/introspect.json       |  6 +++---
>  qapi/job.json              |  2 +-
>  qapi/machine-target.json   |  9 +++------
>  qapi/machine.json          | 22 ----------------------
>  qapi/migration.json        | 12 ------------
>  qapi/misc-target.json      | 14 +-------------
>  qapi/misc.json             | 12 ++----------
>  qapi/net.json              |  2 +-
>  qapi/pci.json              |  2 +-
>  qapi/qdev.json             |  3 +--
>  qapi/qom.json              |  8 +++-----
>  qapi/rocker.json           |  4 ----
>  qapi/run-state.json        |  2 --
>  qapi/stats.json            |  2 +-
>  qapi/tpm.json              |  4 ----
>  qapi/trace.json            |  2 +-
>  qapi/ui.json               | 10 +---------
>  qapi/virtio.json           |  8 +++-----
>  qapi/yank.json             |  1 -
>  scripts/qapi/parser.py     | 15 +++++++++++++++
>  scripts/qapi/schema.py     |  3 +++
>  32 files changed, 95 insertions(+), 140 deletions(-)
> 
> -- 
> 2.48.1
> 


