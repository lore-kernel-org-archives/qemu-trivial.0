Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d5uzJ-0005UM-J6
	for mharc-qemu-trivial@gnu.org; Wed, 03 May 2017 10:10:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d5uzG-0005Tr-G2
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 10:10:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1d5uzC-00043O-G5
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 10:10:38 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:34433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
	id 1d5uzC-00041T-8N
	for qemu-trivial@nongnu.org; Wed, 03 May 2017 10:10:34 -0400
Received: by mail-wm0-x22c.google.com with SMTP id r190so36522460wme.1
	for <qemu-trivial@nongnu.org>; Wed, 03 May 2017 07:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-transfer-encoding;
	bh=0146F5wjW8dqH7m+nNevr2HEoqjwsDGPzaeVj3kedqQ=;
	b=Xy1Di+MAVUu8vLH1AYLaSbdoLrGULldIEghMoxEs3rDMIvLwlDqo/PYzC07B9QoU0M
	aBp1VmrcmH3MC8CaeyjWRNmQxbmIJSP29W/Y9On+sRz1gzAj8ufkoR82NXtc6k86yYbt
	ZrMRQ85B8SYf+lru867V23vMqxEZPm75e9Yx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-transfer-encoding;
	bh=0146F5wjW8dqH7m+nNevr2HEoqjwsDGPzaeVj3kedqQ=;
	b=qQZ6p8LlXIJ8wfwI7LyDRWxDStIxkpfknlS/p3hfbrkZRFoxNjU6FjiNi6ZrMY4NxN
	3YlufO+uMM/3u3Szin0h9Wa+WwtyFh8nJmJNNP0mHU3LWwLJ0PIWLL6oLlD6VC1JL26j
	LKMpRfNc/y2+QRMbmeWkKvPrFKTcsKV53zQ4qTUANOr/jsW45jEaJtCU/goqkep5woUd
	w5QxsN4XO3co9R/b+U+mK864iz8GT5qbE0IVXel6cvxxvkSh9MKPBxE45lfhhN0eEnoc
	oBtHF9gaOPLeWHPcb64FAYKCgMjDUEUdbDj4RXfkRcHb41gNcauGokVi6Senr2cPt0Lc
	MlMA==
X-Gm-Message-State: AN3rC/5aHycNmNL9CH6tjS6/jSXMSzUDBLZYT8yvAFDn2xCBXU7Bqzs1
	erA3XrrgPYCZWqDn
X-Received: by 10.28.220.138 with SMTP id t132mr5256762wmg.140.1493820633284; 
	Wed, 03 May 2017 07:10:33 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	t85sm4942407wmt.23.2017.05.03.07.10.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 May 2017 07:10:32 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3D5863E005D;
	Wed,  3 May 2017 15:11:11 +0100 (BST)
References: <20170503115909.4490-1-pbonzini@redhat.com>
User-agent: mu4e 0.9.19; emacs 25.2.17
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, lvivier@redhat.com
In-reply-to: <20170503115909.4490-1-pbonzini@redhat.com>
Date: Wed, 03 May 2017 15:11:11 +0100
Message-ID: <87bmrani80.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Update paths
 for main loop
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
X-List-Received-Date: Wed, 03 May 2017 14:10:39 -0000


Paolo Bonzini <pbonzini@redhat.com> writes:

> Moved by c2b38b2 ("block: move AioContext, QEMUTimer, main-loop to
> libqemuutil"), let's update MAINTAINERS too.
>
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 62d62a6675..b54c0568c6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1307,8 +1307,8 @@ Main loop
>  M: Paolo Bonzini <pbonzini@redhat.com>
>  S: Maintained
>  F: cpus.c
> -F: main-loop.c
> -F: qemu-timer.c
> +F: util/main-loop.c
> +F: util/qemu-timer.c
>  F: vl.c
>
>  Human Monitor (HMP)


--
Alex Bennée

