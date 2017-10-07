Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0g2f-0007SJ-9J
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 23:44:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0g2d-0007R7-AT
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 23:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0g2c-00067p-GV
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 23:44:43 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:56332)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0g2Y-00066I-8U; Fri, 06 Oct 2017 23:44:38 -0400
Received: by mail-qt0-x241.google.com with SMTP id 34so17718481qtb.13;
	Fri, 06 Oct 2017 20:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ERPSeK3l4rvPk629nwGKXddzbrm6FZeDqUlr6NZcero=;
	b=DK5rKEXQ/SyAY+1czywpZ/1rBAwR9epMDEj/o113sQq5/2JCkFXQQrBGoUhurTonjg
	2xuMVD4QE0G/gfZhNq04KR/apT8nGTrdjbX0BsYzXYaGLz4Vzngb91ZVReO3DnA13awD
	7SkEd1n83KBMentlcfMFltBio5oosBo1wIzaw4X7i05cwKmhT4r1kHohOdgfv+UtZTNH
	BGm9fGe09Zkf1ZdIUQ3VhfFy5byQLyE7iBmWhJhGIqOWV4O5cQTQjZ66AeRNOZcbi6Xh
	V+L0T2UG3pHufkazhirroxP+mQtEfOtYJ4A0LKcjlMCSBNxfdXHa+nDT4i2sQFbx/DpG
	ioiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ERPSeK3l4rvPk629nwGKXddzbrm6FZeDqUlr6NZcero=;
	b=a041anrNgH5/SJvFfU6Tbct4C/QwH3a2ayPkFyZhVBpVJPBLTOjwjTa+LhuonhiezA
	nebTdxIs9rDVP/F3aFRl5w+ECaYl//BsyzlS4VhXOifpXkpUKfM82QSf7llCzlxccCpF
	lYA1xMU6OAOyuoJc9N6dZA01Gm18JYvu0bYZP/Qgj7l9GMC8qOBZYDcKz65o5HvInu1v
	bor5a0y/BgTIXMNfQwgupvVQPuCQFKMZx6rjGtkynXcGojawDr31iohbdNvRY41llfAO
	F7LcSLnrVtnpgfk9Wlikrxs4Ckq2IqrNtiAIkhX2Q5olUxYT9J4PURZY4mLk1JlFNt7C
	p+nQ==
X-Gm-Message-State: AMCzsaXwan+GkuZsVsAdTxEZtzqeL4E2Af7vJAq6JLjbB6o6jFmv42AJ
	DkcoUMMA1BOmDjCu97vO9VhLA+57ovo=
X-Google-Smtp-Source: AOwi7QA4mxrlzZrjk2EThi8suf/UfdEtyLyJtdygfO3Y7dmC+TF7sS11XNb+86O10bDeKc+aOwe68Q==
X-Received: by 10.200.50.113 with SMTP id y46mr4901741qta.315.1507347877435;
	Fri, 06 Oct 2017 20:44:37 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id t32sm1938531qtb.5.2017.10.06.20.44.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 20:44:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Jeff Cody <jcody@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
	<marcandre.lureau@redhat.com>, qemu trival <qemu-trivial@nongnu.org>,
	qemu-block@nongnu.org
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-72-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5c3044e1-abfd-5156-6098-21844ba6d928@amsat.org>
Date: Sat, 7 Oct 2017 00:44:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171006235023.11952-72-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH 71/88] block: avoid use of g_new0()
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
X-List-Received-Date: Sat, 07 Oct 2017 03:44:44 -0000

On 10/06/2017 08:50 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  block/qcow2.c | 2 +-
>  block/vhdx.c  | 9 +++++----
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/block/qcow2.c b/block/qcow2.c
> index f63d1831f8..3e7d6c81be 100644
> --- a/block/qcow2.c
> +++ b/block/qcow2.c
> @@ -2738,7 +2738,7 @@ static int qcow2_create2(const char *filename, int64_t total_size,
>  
>      /* Write the header */
>      QEMU_BUILD_BUG_ON((1 << MIN_CLUSTER_BITS) < sizeof(*header));
> -    header = g_malloc0(cluster_size);
> +    header = g_malloc(cluster_size);

self-NACK since this is wrong.

>      *header = (QCowHeader) {
>          .magic                      = cpu_to_be32(QCOW_MAGIC),
>          .version                    = cpu_to_be32(version),
> diff --git a/block/vhdx.c b/block/vhdx.c
> index 8260fb46cd..91e532df8a 100644
> --- a/block/vhdx.c
> +++ b/block/vhdx.c
> @@ -244,10 +244,11 @@ static void vhdx_region_register(BDRVVHDXState *s,
>  {
>      VHDXRegionEntry *r;
>  
> -    r = g_new0(VHDXRegionEntry, 1);
> -
> -    r->start = start;
> -    r->end = start + length;
> +    r = g_new(VHDXRegionEntry, 1);
> +    *r = (VHDXRegionEntry) {
> +        .start = start,
> +        .end = start + length,

this is not wrong since all members are initialized, but it is not good
code practice (if the VHDXRegionEntry structure is expanded with another
member).

> +    };
>  
>      QLIST_INSERT_HEAD(&s->regions, r, entries);
>  }
> 

