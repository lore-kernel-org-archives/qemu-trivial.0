Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gzQAG-0006Ti-Fn
	for mharc-qemu-trivial@gnu.org; Thu, 28 Feb 2019 13:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gzQAD-0006S3-U9
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 13:12:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gzQAB-0007zt-U1
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 13:12:09 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gzQAA-0007vj-1z
	for qemu-trivial@nongnu.org; Thu, 28 Feb 2019 13:12:07 -0500
Received: by mail-wr1-f66.google.com with SMTP id w17so23010197wrn.12
	for <qemu-trivial@nongnu.org>; Thu, 28 Feb 2019 10:11:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UN7tL4+X4kY0BynhofcJjeHedcJWKbxe1/qzTcLYE2w=;
	b=RaWVXqiuPoB3ykz8Ft7s4rBSMwtmotHmzbwqNVhLSvuKgc+UCK9wVRR8/pXYNPRIRI
	+8X6WzFWawIF9P/ZMrdSGdZB3i5hjUXc5K7Hpw0gzrz6+SyfNB4rLpEKKVFYbp4BqRtf
	8TIaS66bFAYEHzCDjVBdk5sDNb6VlbXm+fKdIbHVK8VwBT+5E+gQdV0bO5Uc+lz6Jbtj
	YSW7vjY7BtgavqRHHZiX8jWFFgVFw+bgOuk1BN5qOHXxXx8KbAuRklmFpHyp5kkS3/xO
	Jd+r5ccp3/JTWvrdSywXbSCtXs+va19FmAeK36NGW0cWD2yqSzbV+IeHewMLtu2CmS2r
	/sEA==
X-Gm-Message-State: APjAAAXj+gP7SDxDq3dr7vkGGLMkdnGUB8Ti8p2XXKrxGQ9wbRpRfsyd
	2zG9M/rk87yYm+vAwd31qW6FUw==
X-Google-Smtp-Source: APXvYqzzsSzMtabgjPVhO/1wKHAHVXABdO8eMu3s+VsemUUfiw1pz1WBAMDXfkLHxkZxjgyJZUZnrQ==
X-Received: by 2002:adf:f4c8:: with SMTP id h8mr563292wrp.6.1551377512901;
	Thu, 28 Feb 2019 10:11:52 -0800 (PST)
Received: from [192.168.1.37] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	h184sm2887228wmf.0.2019.02.28.10.11.51
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 10:11:52 -0800 (PST)
To: Aarushi Mehta <mehta.aaru20@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Hajnoczi <stefanha@gmail.com>, Julia Suvorova <jusual@mail.ru>
References: <63559cf027d4ebd95a844b73b1f20444fb72fb2c.camel@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <62cddadf-8327-fdd1-baa9-c4ade791b8ee@redhat.com>
Date: Thu, 28 Feb 2019 19:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <63559cf027d4ebd95a844b73b1f20444fb72fb2c.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3] trivial fix of malloc to
 g_new in thunk
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
X-List-Received-Date: Thu, 28 Feb 2019 18:12:10 -0000

On 2/28/19 5:46 PM, Aarushi Mehta wrote:
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> Note that since thunking occurs throughout the lifetime of the QEMU
> instance, there is no matching 'free' to correct.
> 
> ---
>  thunk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/thunk.c b/thunk.c
> index d5d8645cd4..17f3d320bb 100644
> --- a/thunk.c
> +++ b/thunk.c
> @@ -89,7 +89,7 @@ void thunk_register_struct(int id, const char *name,
> const argtype *types)

Clearer than using a single:

       se->field_offsets = g_new(int *, nb_fields * 2);

So:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      for(i = 0;i < 2; i++) {

BTW we can replace here by:

       for (i = 0; i < ARRAY_SIZE(se->field_offsets); i++) {

>          offset = 0;
>          max_align = 1;
> -        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
> +        se->field_offsets[i] = g_new(int, nb_fields);
>          type_ptr = se->field_types;
>          for(j = 0;j < nb_fields; j++) {
>              size = thunk_type_size(type_ptr, i);
> 

