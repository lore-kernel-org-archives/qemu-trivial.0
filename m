Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fGHFU-0004XB-G9
	for mharc-qemu-trivial@gnu.org; Wed, 09 May 2018 01:02:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGHFR-0004Wx-SD
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 01:02:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGHFN-0005GD-Pi
	for qemu-trivial@nongnu.org; Wed, 09 May 2018 01:02:41 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:43544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fGHFN-0005Fe-KW; Wed, 09 May 2018 01:02:37 -0400
Received: by mail-qt0-x241.google.com with SMTP id f13-v6so34335579qtp.10;
	Tue, 08 May 2018 22:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wWxpUdYdYUnQes2k/KobDAXfzSlkkxalEnif+7BSoH0=;
	b=Bddg9rYtWe0iArLSJOLGnCFgCrCHfrGI9xJWnc5NzCaIMETXgv9AO8bUViU7uJxRhZ
	q1GzZYRmU0IcWjwk79nLhv+/V9A+krNaly5XmKRLZjl1GTHwxrmzPkEyP0In9bkqu+aB
	UCSr6GZI/YWZs32DZRuYTldwR22UMwsOVh+3m5SNKGAO76TPs9XAD5ArRAbFRVHDpU9i
	xCRRheeP1gQXaSFWO27ChWORcoRDEiJt/c3zXLeNB1bywuXRsBQr09iVjfjhPxmfeqbs
	ElRrEm8+NUiCDyUQgRhDPltL9nUEotLDk4hcdFgYAs4wKESEgU/yfg3IubtY69XD3mcT
	7uew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wWxpUdYdYUnQes2k/KobDAXfzSlkkxalEnif+7BSoH0=;
	b=eVNJJR3SF54sCbabzTJ41o98kNC1W5+efqpt0kiisONhYVmiTdUF9BUxKF625yKnCz
	VlCjOyLLQkfyFSnwdNbrboqIcGguJ0ldBIze7hy8a2ct3O/ls1nzp4rcX9u7QPdEPD1R
	V0U46PnQBMCY8QM3foUNCkCyu+XEmlfnkDu/3pHnrVrujK26KAjMLCEAjIZYI3r//XB2
	V5s/q7MtbckoxRQvxZ0uqKzPg+8JdAl8d/qidyH52s+TcVuC78a8EIqBk3KqhRBICtgc
	QVPLuaHuf6zmQ1xaFNgbwzemJebxL+O+RJmJM5SWTmMjfpubK98551NE52oI6BMUrsO2
	XfqA==
X-Gm-Message-State: ALQs6tBr/xfMtbG+EE6TCZvfR/DJxTSAlQLXq8sQxcjHkzAWR8eWRF4d
	KoxVPh2qtOFCIwPUk91w/s8nWEcR
X-Google-Smtp-Source: AB8JxZqBb1MF/LHU4FenaaYKfnh6LHKQGeN2EmgGK39fZ21rb//KNEjB6rEYwivI/4ukmLV0uG74qA==
X-Received: by 2002:ac8:1a2d:: with SMTP id
	v42-v6mr41597657qtj.121.1525842156498; 
	Tue, 08 May 2018 22:02:36 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	l8-v6sm7570027qtb.82.2018.05.08.22.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 22:02:35 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <1525840700-30635-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f0a24157-3aa9-4b51-8870-e83407e85697@amsat.org>
Date: Wed, 9 May 2018 02:02:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1525840700-30635-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Add
 trace-events and qemu-option-trace.texi to tracing section
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
X-List-Received-Date: Wed, 09 May 2018 05:02:42 -0000

Hi Thomas,

On 05/09/2018 01:38 AM, Thomas Huth wrote:
> The "trace-events" and "qemu-option-trace.texi" files in the top directory
> are currently "unmaintained" according to scripts/get_maintainer.pl. They
> obviously belong to the Tracing section, so add an entry for them there.

I agree qemu-option-trace.texi belongs to the Tracing section,
however I think trace-events is not specific to Tracing but belongs to
everybody maintaining a C file in the top directory... Since they'll
need to modify this file.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 459e359..e187b1f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1656,6 +1656,8 @@ Tracing
>  M: Stefan Hajnoczi <stefanha@redhat.com>
>  S: Maintained
>  F: trace/
> +F: trace-events

So without "trace-events":
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +F: qemu-option-trace.texi
>  F: scripts/tracetool.py
>  F: scripts/tracetool/
>  F: docs/devel/tracing.txt
> 

