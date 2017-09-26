Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwl8m-0004m1-V9
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 04:22:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dwl8k-0004lB-KY
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 04:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1dwl8j-000249-T0
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 04:22:50 -0400
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:47855)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1dwl8d-00022T-RX; Tue, 26 Sep 2017 04:22:43 -0400
Received: by mail-wm0-x232.google.com with SMTP id r136so5007513wmf.2;
	Tue, 26 Sep 2017 01:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=yhAxbx8FB5cX1YwsmCmRHxKIyqYMd9+JMdJDHrPYW8M=;
	b=WInp0W6SA3rP8oV9KgnKWhZD7epRxw4kzQpc2Jwga9QYvzj00Tygqr5wR9IE65+Zbg
	UP+xuaWs0y1F/pEzXzxvRA2EIU6yoULEKUniRnciqam//gEeClrMQ5KcygzDc3KD6ZgQ
	XjQulcxSkKtq36HLjPZPlUxLtUKi7113CJ3XuvA7XodMxpC4dpQ9E0L7ovwsk3e1RUUI
	BHPYNbY6cTHgfMQH7Mh8oWskwKHI8pUiKGMYp1U+eVFn5/VN3QGMiRRy8h/OEDp8FJ/O
	5sHpGdpEOFxKbBKqE8j1k2cjGH2pOIb2wVTgh7DUtr/Wk4RQuPM3ygJZBNyVCnfWS6jO
	dmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=yhAxbx8FB5cX1YwsmCmRHxKIyqYMd9+JMdJDHrPYW8M=;
	b=e0cz/2NF20tbWEWg52Ytqn7ZtV9UuqEL4w2lX4qmztJrcmgltuSYkR4BGiuPbpQh0W
	j/g8YeCOnhd5qQdiQ09sykl3fiCLByWjv6kUFnspybKoPJ3VoXBMBnUbjyPhXozXFXe4
	NQWHkD2jfFANITamW3n48BT6rLAMb+IVCSblRYpk2STLjNYkK91wgr0aP0qmITroJJc6
	W3xSinU1/+oPRfK+RxKl4SILi+39WoZhHmjFts1gCmCteOZciLPM/1NX9eS18MNsUvu9
	GVg0d4b3tWOiLPKBRun+/7Pdm0pPV/HqBwM9vh7VP/RrQCIGSeNUSklahHQoWhzgxtB1
	B+Sg==
X-Gm-Message-State: AHPjjUiUTkO3C9+6sS7Jxjub+cqGJEnXyAtbhF/4ChYTwgYd/K0zRAZz
	y/fYbXIuel9Eqt5ZlJDZNQc=
X-Google-Smtp-Source: AOwi7QB1/g4Gixq4zXmdQuKsGddiz7Fd2AZhuFPa3S7ER27dIEAFF12mQQSJkzQScY3B6vfGyqwkpg==
X-Received: by 10.28.13.76 with SMTP id 73mr2191325wmn.101.1506414162720;
	Tue, 26 Sep 2017 01:22:42 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id n9sm2217844wmd.12.2017.09.26.01.22.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Sep 2017 01:22:41 -0700 (PDT)
Date: Tue, 26 Sep 2017 09:22:40 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170926082240.GA16834@stefanha-x1.localdomain>
References: <20170926060944.5962-1-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170926060944.5962-1-mjt@msgid.tls.msk.ru>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::232
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc.texi: remove
 trailing whitespace
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
X-List-Received-Date: Tue, 26 Sep 2017 08:22:51 -0000

On Tue, Sep 26, 2017 at 09:09:44AM +0300, Michael Tokarev wrote:
> Reported-By: Vagrant Cascadian <vagrant@debian.org>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  qemu-doc.texi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

