Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Qqr-0001Pm-Js
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 10:13:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QHk-0004iu-2t
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:36:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g8QHg-0003dD-UT
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:36:52 -0400
Received: from mail-wr1-f48.google.com ([209.85.221.48]:37212)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g8QHf-0003WS-1U
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 09:36:48 -0400
Received: by mail-wr1-f48.google.com with SMTP id y11-v6so2856499wrd.4
	for <qemu-trivial@nongnu.org>; Fri, 05 Oct 2018 06:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Kh/mVGeEGQDWLT6EaYcxnl9Cm8plL5/VolviNCeI6w8=;
	b=Dzug7kcaf7WDS6xhggQfdf9Jmw6kmmm57wQc/TO/t7iFxS9U7o96hZq4dpLqLIkQKD
	KtOYUSksVY7ti2P1hs0o7Wf2tUBr0s6voMygxbXJLSpWQFKp22E/g+0ytGXhZYOLm+Hw
	lnMXScIWQllwcdIHKGpQK6b0M0aSoHPOkJ6cEU0HtHqFGjwZfgPlxXI85v8/A46aw8Pl
	jWs1de2Hh2SkYsT69hYBlEcn/1I1Z0ePKY2LP+De4I+GC9TT/8tkGHlpNgj/mGe9/mem
	vwsA7tBWe1dbaQzp1/8V4Kp+jfQXRg8O+ofCEhyVOjIXoQvbgXz6Gy+Rrn3KhOqBXWBU
	eQuA==
X-Gm-Message-State: ABuFfojDBb1K8LvGwJa6ghhHRCLQ0Tq4y653vIiblkbkGc8H16OJS2rM
	rF87yDptP3T7RgcoZbdjbF2iIw==
X-Google-Smtp-Source: ACcGV62debFTkT8tf6ZhAdahxVZ6espHnw1onmZ4r5QNpJp2QH5Dn5DbHzzmy2I3IS+uzRmrlKIGHg==
X-Received: by 2002:adf:b743:: with SMTP id
	n3-v6mr8509701wre.274.1538746605576; 
	Fri, 05 Oct 2018 06:36:45 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	t4-v6sm7465870wrb.45.2018.10.05.06.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 06:36:44 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
	Eric Blake <eblake@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4ebd6e33-e1e7-962f-3ca8-4bae7b7ce425@redhat.com>
Date: Fri, 5 Oct 2018 15:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-4-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.48
X-Mailman-Approved-At: Fri, 05 Oct 2018 10:13:08 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/10] qemu-iotests: make
 218 executable
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
X-List-Received-Date: Fri, 05 Oct 2018 13:36:52 -0000

On 04/10/2018 18:18, Cleber Rosa wrote:
> Commit 990dc39c made all tests executable at the time, but 218 came in
> later, and missing those permissions.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/qemu-iotests/218 | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  mode change 100644 => 100755 tests/qemu-iotests/218
> 
> diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
> old mode 100644
> new mode 100755

We could add a git pre-commit hook grep'ing for "^#!\
*(/usr/bin/env|/bin/(b?a)?sh)" in the 1st line and then checking the
file perms.

