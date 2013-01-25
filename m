Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tynjo-0007wc-5w
	for mharc-qemu-trivial@gnu.org; Fri, 25 Jan 2013 13:10:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1Tynje-0007U7-T4
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:10:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>) id 1TynjZ-0004tC-LY
	for qemu-trivial@nongnu.org; Fri, 25 Jan 2013 13:10:42 -0500
Received: from mail-da0-f50.google.com ([209.85.210.50]:47699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vishvananda@gmail.com>)
	id 1TynjN-0004qY-81; Fri, 25 Jan 2013 13:10:25 -0500
Received: by mail-da0-f50.google.com with SMTP id h15so283343dan.23
	for <multiple recipients>; Fri, 25 Jan 2013 10:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=W0H6KyF4jIOacdOoqNyKgibljNvO9uMlbEpjzF/x8Ig=;
	b=DDwNe2HxFWCHI1+jwU3ZF0P2CnBoSAs/PabG1gYdP8OGKYywrmK3JxTvQgtNoFURB3
	jhB4VciP2M5DUlpS7CPEkqkRws2KdqMk3f2Yhep2t1AEumdav9YeLtrlUsQxYtM32msP
	+nI+KCvz7QFfTXiFLNiun0YnZDKIRQ0N0zEm+K+7hzS0uCLBSf4X1uCLnEwFk2tt0Y5k
	U29g47lclFIUus+ihUowNWK2qhS53dhZgcPDvQ4xpvDH44EG7XQbwnXm+9Gkf5s/Bzvt
	n6eUtIiZ9Btqv9BexsxVZ+K67O2JH7zU6NXAIGSl8768RrVf+gWXGMQbTp6Yz0AXcm3M
	XYWQ==
X-Received: by 10.66.87.67 with SMTP id v3mr15391882paz.63.1359137421626;
	Fri, 25 Jan 2013 10:10:21 -0800 (PST)
Received: from [10.146.16.38] (50-0-250-146.dedicated.static.sonic.net.
	[50.0.250.146])
	by mx.google.com with ESMTPS id x6sm1284847paw.0.2013.01.25.10.10.20
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 10:10:20 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Vishvananda Ishaya <vishvananda@gmail.com>
In-Reply-To: <51024DE2.907@redhat.com>
Date: Fri, 25 Jan 2013 10:10:22 -0800
Content-Transfer-Encoding: 7bit
Message-Id: <DAF889AE-060E-4C05-BC98-FC4AF47CAAAF@gmail.com>
References: <1359050440-52511-1-git-send-email-vishvananda@gmail.com>
	<51024DE2.907@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
X-Mailer: Apple Mail (2.1499)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.210.50
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Create proper size file for disk
	mirror
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Jan 2013 18:10:49 -0000


On Jan 25, 2013, at 1:18 AM, Kevin Wolf <kwolf@redhat.com> wrote:

> Am 24.01.2013 19:00, schrieb Vishvananda Ishaya:
>> The qmp monitor command to mirror a disk was passing -1 for size
>> along with the disk's backing file. This size of the resulting disk
>> is the size of the backing file, which is incorrect if the disk
>> has been resized. Therefore we should always pass in the size of
>> the current disk.
>> 
>> Signed-off-by: Vishvananda Ishaya <vishvananda@gmail.com>
> 
> Thanks, applied to the block branch.
> 
> Can you send a qemu-iotests test case that tests this condition?
> (Probably best as an extension to case 041)

I have a test for this. Would you like it as a separate patch or
should i respin the original?

Vish

