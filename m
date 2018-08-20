Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1frkJK-0002Yg-25
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2018 09:33:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1frkJF-0002Qe-QI
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 09:33:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1frkEo-00084f-AW
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 09:28:58 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:40098)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1frkEo-00084M-3g
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2018 09:28:54 -0400
Received: by mail-wm0-f67.google.com with SMTP id y9-v6so13957148wma.5
	for <qemu-trivial@nongnu.org>; Mon, 20 Aug 2018 06:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fYWmYbYK4033OOp4L03VpnQB6CVHboWhROqh+5zvCHI=;
	b=SH1TQnfoLQa/oD1ds4hClIf+8xwIJ8IQ8YnFMjwTRZEPC7uteXMIJBvT3EI0Uu9zHZ
	lVKAFxioMAqETLRny2ins+TnS9e7f4YhUOrrkEhd4KuPBWTNC8mPyluNSBDODugKqD2t
	iYI1Y7AS/yd5fy15L2KevaSWPOsZgp9kyquUDqEqtT2JRDNmZeyIoPKL5NgnrgdzTZTq
	9pws/KWJsYsze3N3xkrkWWzdOcZnfJRMgYLiC6J/mJuxKh9hb6HP1RQ00NFWQ2qoNDe/
	ErJFfzr7zUHCLZ87Vp9pXK9FaCi3fuddexZ5ZFxTNtF6Kc/vvhEduycGEVetShxk5qdX
	pshA==
X-Gm-Message-State: AOUpUlHbmGAIjNboQ4JPMuBzgVQ2PivHg58zPCybU5HIYBTi2tv2+AH8
	QmQaXKcEGJfWb9+meT8KWfzLIA==
X-Google-Smtp-Source: AA+uWPxtdfL3M7sek91o1meyK9Msi/GYMpCVNyqB02867OXRkQLq3/YBufpe9YthJKaHJIGB4IWydg==
X-Received: by 2002:a1c:889:: with SMTP id
	131-v6mr24379361wmi.142.1534771733152; 
	Mon, 20 Aug 2018 06:28:53 -0700 (PDT)
Received: from [10.32.181.140] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
	by smtp.gmail.com with ESMTPSA id
	f8-v6sm10049884wrj.9.2018.08.20.06.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 06:28:52 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	David Hildenbrand <david@redhat.com>,
	Howard Spoelstra <hsp.cat7@gmail.com>, 
	Hitoshi Mitake <mitake.hitoshi@lab.ntt.co.jp>
Cc: Kevin Wolf <kwolf@redhat.com>,
	"open list:Sheepdog" <sheepdog@lists.wpkg.org>,
	"open list:Sheepdog" <qemu-block@nongnu.org>, qemu-trivial@nongnu.org, 
	Jeff Cody <jcody@redhat.com>, qemu-devel@nongnu.org,
	Liu Yuan <namei.unix@gmail.com>, Max Reitz <mreitz@redhat.com>
References: <20180818025600.21132-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5123af35-773e-cf2a-2e41-2198e0af7c61@redhat.com>
Date: Mon, 20 Aug 2018 15:28:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180818025600.21132-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] sheepdog: Replace strncpy()
 by g_strlcpy()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Aug 2018 13:33:33 -0000

On 18/08/2018 04:56, Philippe Mathieu-Daudé wrote:
> Fedora 29 comes with GCC 8.1 which added the 'stringop-truncation' checks.
> 
> Replace the strncpy() calls by g_strlcpy() to avoid the following warning:
> 
>   block/sheepdog.c: In function 'find_vdi_name':
>   block/sheepdog.c:1239:5: error: 'strncpy' specified bound 256 equals
>   destination size [-Werror=stringop-truncation]
>        strncpy(buf + SD_MAX_VDI_LEN, tag, SD_MAX_VDI_TAG_LEN);
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> See http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg03723.html
> 
>  block/sheepdog.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/block/sheepdog.c b/block/sheepdog.c
> index b229a664d9..5dc3d0c39e 100644
> --- a/block/sheepdog.c
> +++ b/block/sheepdog.c
> @@ -1224,19 +1224,19 @@ static int find_vdi_name(BDRVSheepdogState *s, const char *filename,
>      SheepdogVdiReq hdr;
>      SheepdogVdiRsp *rsp = (SheepdogVdiRsp *)&hdr;
>      unsigned int wlen, rlen = 0;
> -    char buf[SD_MAX_VDI_LEN + SD_MAX_VDI_TAG_LEN];
> +    /* Ensures that the buffer is zero-filled,
> +     * which is desirable since we'll soon be sending those bytes, and
> +     * don't want the send_req to read uninitialized data.
> +     */
> +    char buf[SD_MAX_VDI_LEN + SD_MAX_VDI_TAG_LEN] = { };
>  
>      fd = connect_to_sdog(s, errp);
>      if (fd < 0) {
>          return fd;
>      }
>  
> -    /* This pair of strncpy calls ensures that the buffer is zero-filled,
> -     * which is desirable since we'll soon be sending those bytes, and
> -     * don't want the send_req to read uninitialized data.
> -     */
> -    strncpy(buf, filename, SD_MAX_VDI_LEN);
> -    strncpy(buf + SD_MAX_VDI_LEN, tag, SD_MAX_VDI_TAG_LEN);
> +    g_strlcpy(buf, filename, SD_MAX_VDI_LEN);
> +    g_strlcpy(buf + SD_MAX_VDI_LEN, tag, SD_MAX_VDI_TAG_LEN);
>  
>      memset(&hdr, 0, sizeof(hdr));
>      if (lock) {
> 

The protocol doesn't require (as far as I can see) the strings to be
NULL-terminated, therefore strncpy is the right function to use here.

However, we should have a check on the length of filename and tag, so
that no truncation is done.  This applies to both strncpy and g_strlcpy.

Indeed I find g_strlcpy to be harmful because it encourages a style
where truncations happen silently.  There are very few cases where
silent truncation is the right thing to do, and in several cases where
you _have to have_ fixed-size buffers, those buffers are sent on the
wire---and then g_strlcpy is wrong, while strncpy is just as good as
memset+strlen+memcpy (and shorter).

Paolo

