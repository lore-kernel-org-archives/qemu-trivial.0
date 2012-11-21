Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TbExh-0005Gc-6S
	for mharc-qemu-trivial@gnu.org; Wed, 21 Nov 2012 13:23:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TbExd-0005Eu-Tp
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 13:23:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1TbExc-0003BH-M1
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2012 13:23:45 -0500
Received: from mail-ie0-f173.google.com ([209.85.223.173]:64799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>)
	id 1TbExc-0003BD-GL; Wed, 21 Nov 2012 13:23:44 -0500
Received: by mail-ie0-f173.google.com with SMTP id e13so658416iej.4
	for <multiple recipients>; Wed, 21 Nov 2012 10:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=7eFAdFGKREbhk2g0xzAqyUlp2V1vGCbzw9VIrhysWoI=;
	b=TuBZtkjpzk2CLjz8iqCK21VmG50hTnGCoySsDvsdLwpTGAYz8dJmw5RnWkrzK7YrOk
	RAxiOdr2AmGUUN63475fWiqqJHeioc5MRh6hOmXPISafO4EeuMTsYUsyuBdFjrldc7EW
	gMV+ZJaaVmji5hKPVC0QcO6UYaRHD02wEN6zAiN9C+JTegsfr2JkplEpTd366dkXLHXz
	R66XC4mPHiwxqjyZu6MNNO2G3Xw+q2cjLo4MGsT3JQf1AANd2cR5gixWVDf5n9tYh+eQ
	5wV9HIVDFp/3ROzo9X+vrv/3rhEYUjkr2PiyGOmtbvI5uUdw9PuaSBs4Z5wYsXnLeM9t
	7nvQ==
Received: by 10.50.195.196 with SMTP id ig4mr468954igc.33.1353522223917;
	Wed, 21 Nov 2012 10:23:43 -0800 (PST)
Received: from pebble.twiddle.home (mb12036d0.tmodns.net. [208.54.32.177])
	by mx.google.com with ESMTPS id v12sm258481igv.3.2012.11.21.10.23.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Nov 2012 10:23:42 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Message-ID: <50AD1C33.8060509@twiddle.net>
Date: Wed, 21 Nov 2012 10:23:47 -0800
From: Richard Henderson <rth@twiddle.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121029 Thunderbird/16.0.2
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
References: <1351805797-31899-1-git-send-email-rth@twiddle.net>
	<50AD06A6.3000602@twiddle.net> <50AD0AB3.7020207@suse.de>
In-Reply-To: <50AD0AB3.7020207@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/3] trivial: Remove some
 pre-TCG CPUArchState members
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
X-List-Received-Date: Wed, 21 Nov 2012 18:23:47 -0000

On 2012-11-21 09:09, Andreas Färber wrote:
> Not sure if this fits our current Hard Freeze definition though. ;)

How often do I need to ping patches to get them applied?
I've generally been waiting 1-2 weeks between pings.
I've got at least 5 minor patch sets outstanding, dating
back to at least late September.

I hope for the next release there's both soft and hard
freeze periods, and much more help from those with commit
privs in reducing the outstanding patch queues before we
decide on "done".


r~

