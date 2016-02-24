Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYaRS-0003br-Mz
	for mharc-qemu-trivial@gnu.org; Wed, 24 Feb 2016 09:29:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aYaRQ-0003Yk-5u
	for qemu-trivial@nongnu.org; Wed, 24 Feb 2016 09:29:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aYaRP-0008FI-CH
	for qemu-trivial@nongnu.org; Wed, 24 Feb 2016 09:29:24 -0500
Received: from mail-pa0-x242.google.com ([2607:f8b0:400e:c03::242]:35687)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aYaRK-0008Eq-W7; Wed, 24 Feb 2016 09:29:19 -0500
Received: by mail-pa0-x242.google.com with SMTP id fl4so972424pad.2;
	Wed, 24 Feb 2016 06:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P1nBCnExmLOqPgV3oY6BFHUO1p17kaHy1sW9i39b6zg=;
	b=wlymASLWb6LgTPUGgytUxPzFQDnu26KLM6DzpTQJut6mXeMfqqiVmOPnzNhXA9gKnD
	/y2AUlNYKhhMKX4Efs74u9HRD0v6yVfAdtOkBZXZ8NdAplKDhImLTOfvqXIJhfCCC27h
	Lt3ZekQsDv/Du7R/EViIdossyt619qUohJYqpHf5jHDi8CErbMQlQ3YqrFt+IQleL0cE
	uO41THcEsYCloR89Pm5HUzEI7H0EbQp3CvUx128jMsvFuYm2FZHGdm4uD8/ViUrDb5Al
	oF6ddz+OQuvpclevItz+AGzWA2Iesrx/nIxsEqmdXJPNf7G34QBVSnjflQ68wxC0wCP+
	xZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=P1nBCnExmLOqPgV3oY6BFHUO1p17kaHy1sW9i39b6zg=;
	b=EevKQvq5l2YvjdsnjX+thVKIETUwDR/yqbboYlaZUVpaONSDqUQGmgfiS19iAifBpZ
	7hd44nbm2qG9sQ6ppBhmTY/ROyAzV71AUjurW/kzU3vI2Z1NVALyWr3fkaBVbYGaFkDF
	i8Lr6ozJYuQs4oPNKIn2cu+NC37Xjh0ClYrZ7EO+mt08Zu6pcNaCljrTgfQy//t+F2eo
	XeSOkerb5NOn1/Clv4pxkdWNvNmZndfIUb55YU3Lr1WofKOnWe487qb7KiGwuwSdocCp
	dkodlcku5LO6OEXS4mNnl4BZjogoOwNAekOE1cqD22H3r8I1vTujtvFxoftds+w1RFvt
	QkXA==
X-Gm-Message-State: AG10YOQYuh5aZqOQDW4fUIZjO8DLsok5xaqhjsbpwkfDDLQX4gQXZEW4DRuv9I99qcn/vQ==
X-Received: by 10.66.132.73 with SMTP id os9mr54588969pab.27.1456324158268;
	Wed, 24 Feb 2016 06:29:18 -0800 (PST)
Received: from localhost ([45.32.44.20])
	by smtp.gmail.com with ESMTPSA id 69sm5586946pfj.20.2016.02.24.06.29.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Feb 2016 06:29:17 -0800 (PST)
Date: Wed, 24 Feb 2016 14:29:15 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Cornelia Huck <cornelia.huck@de.ibm.com>
Message-ID: <20160224142915.GA16721@vultr.guest>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
	<1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
	<20160224104015.4d3430fc.cornelia.huck@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160224104015.4d3430fc.cornelia.huck@de.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::242
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-devel@nongnu.org, Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH 2/2] s390x/pci: use PCI_MSIX_FLAGS on
 retrieving the MSIX entries
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Wei Yang <richard.weiyang@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Feb 2016 14:29:25 -0000

On Wed, Feb 24, 2016 at 10:40:15AM +0100, Cornelia Huck wrote:
>On Fri, 19 Feb 2016 15:18:11 +0000
>Wei Yang <richard.weiyang@gmail.com> wrote:
>
>> Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
>> the more proper on retrieving MSIX entries.
>> 
>> This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> CC: Cornelia Huck <cornelia.huck@de.ibm.com>
>> CC: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
>>  hw/s390x/s390-pci-bus.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
>Thanks, applied to s390-next.

Thanks :-)

-- 
Wei Yang
Help you, Help me

