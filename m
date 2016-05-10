Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0BtO-0001qF-CG
	for mharc-qemu-trivial@gnu.org; Tue, 10 May 2016 13:56:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b0BtK-0001ip-5E
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 13:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1b0BtI-0002US-VF
	for qemu-trivial@nongnu.org; Tue, 10 May 2016 13:56:17 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:33042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1b0Bt2-0002RY-1T; Tue, 10 May 2016 13:56:09 -0400
Received: by mail-wm0-x244.google.com with SMTP id r12so4022663wme.0;
	Tue, 10 May 2016 10:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=TBpQW2d0uT+6tGxo70exXhHYiEUVqpSnCjKS3wD1SCU=;
	b=alR65iKtSljkeuOPFy5Q57UylBOXa8dqVVS1CxHwCEtWvKyTQDXw4MTYtoid8TUa1G
	om34g4TblMpW5lrdcJNapctJsbGbIVaa9ZKGgmnAWWjmu4HR+3m1Axe16grSAvwmKPSI
	2CBlyGPea8RljizuLyvtBBck8vkNjCseV8rrLdKnFP58tnxOJH8Rovh+Yck1hJWqCBRp
	LRI4MoqprL+G6YKX5IfPB8Vbf1K/ooRuqI0BwHFSfTiGwMhs/0+7Oj9LrEHl7aQfciZO
	PhX7UdDVGF5VLt8e/1dzH5FQ3gH8fbDZh/7WNT9sQss1HJshYXzswxPxdzsB9bwdAeO+
	Q3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=TBpQW2d0uT+6tGxo70exXhHYiEUVqpSnCjKS3wD1SCU=;
	b=K/uSJMu1mJZ2kxBfXnsPvq50Rf6ZdKj6OzPh5ipEZqS/o5pnTDsBqoOTYZ7ZWl9I60
	XPmEXIg+MIVo1Y0oZBthNLPGCDIakZLIk9I5/S0nRsRTst5f8jB0TR2ZbFeIs38/JJWT
	h+AY2WaCK+rXWzE41SHXA6H6ZvUpRX0T+nscyA5Dy/j5UisrAdZZ7Xxml+2YZwWUpQ0v
	yLInKwNWRndaw8JS/61zKgonTyc6hi8KeH6prQojVf0TzWw0VjSiC2j+9aQv5VF8e3zs
	y1NDfRA3UaLmjc4zFgV/S7Jb8WeaJUKPSDiKbVsg6i9sPabANd4MSEjxG7JV+VZ5PEUd
	pORg==
X-Gm-Message-State: AOPr4FWReUA2NF9GfMa+W3cIKkD/cWNa5vnO/cUZ4c3sqqTr2TB6gjXJ6/vbRh1LmKLeQg==
X-Received: by 10.28.129.6 with SMTP id c6mr19197349wmd.75.1462902959182;
	Tue, 10 May 2016 10:55:59 -0700 (PDT)
Received: from [192.168.10.150] (dynamic-adsl-78-12-252-58.clienti.tiscali.it.
	[78.12.252.58]) by smtp.googlemail.com with ESMTPSA id
	i3sm3737070wjx.30.2016.05.10.10.55.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 10:55:57 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
To: Alex Bligh <alex@alex.org.uk>, Eric Blake <eblake@redhat.com>
References: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
	<5731E99C.3000108@redhat.com>
	<3271D86E-D54C-44FC-9FD6-2E2C51F5FB6D@alex.org.uk>
	<5731FE53.6010602@redhat.com>
	<672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"nbd-general@lists.sourceforge.net" <nbd-general@lists.sourceforge.net>,
	"qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
	qemu block <qemu-block@nongnu.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <573220AC.9010704@redhat.com>
Date: Tue, 10 May 2016 19:55:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <672ED845-88C6-4C96-B2DC-F4BCBD85F788@alex.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-trivial] [Nbd] [Qemu-devel] [PATCH] nbd: fix trim/discard
 commands with a length bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Tue, 10 May 2016 17:56:21 -0000



On 10/05/2016 17:38, Alex Bligh wrote:
> > and are at the
> > mercy of however the kernel currently decides to split large requests).
> 
> I am surprised TRIM doesn't get broken up the same way READ and WRITE
> do.

The payload of TRIM has constant size, so it makes sense to do that.
The kernel then self-imposes a 2GB limit in blkdev_issue_discard.

On the other hand, READ and WRITE of size n can possibly require O(n)
memory.

Paolo

