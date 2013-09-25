Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VOrAs-0000ME-1k
	for mharc-qemu-trivial@gnu.org; Wed, 25 Sep 2013 11:38:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOrAk-0000B5-5W
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 11:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VOrAe-0001lb-5D
	for qemu-trivial@nongnu.org; Wed, 25 Sep 2013 11:38:38 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:59152
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VOrAR-0001jY-LB; Wed, 25 Sep 2013 11:38:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 6DBFA2682D53;
	Wed, 25 Sep 2013 17:38:18 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HjKcb5hBKF2G; Wed, 25 Sep 2013 17:38:18 +0200 (CEST)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 5CD6E2682B9D;
	Wed, 25 Sep 2013 17:38:15 +0200 (CEST)
Message-ID: <5243035D.4080200@adacore.com>
Date: Wed, 25 Sep 2013 17:38:05 +0200
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
	<1380041161-13266-4-git-send-email-chouteau@adacore.com>
	<CAFEAcA9A1JD7hPqZ5Y5d4UDFSa4DqJZOz_yTrjH92B7h8N-Lug@mail.gmail.com>
In-Reply-To: <CAFEAcA9A1JD7hPqZ5Y5d4UDFSa4DqJZOz_yTrjH92B7h8N-Lug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 3/3] Add ARM registers definitions in
	Monitor commands
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
X-List-Received-Date: Wed, 25 Sep 2013 15:38:44 -0000

On 09/25/2013 01:53 AM, Peter Maydell wrote:
> 
> No, I really don't want to see another target #ifdef ladder, please.
> Put a 'static const MonitorDef *monitor_defs;' into CPUClass,
> and initialize it in each target's class init function, please.
> (You'll need to move the appropriate sections of the current
> static array in monitor.c plus the per-target functions that
> it references into target-*/cpu.c.) Look at gdb_num_core_regs
> as an example of where we made this kind of abstraction.
> 

I tried already. Where whould you put the declaration of MonitorDef type?

-- 
Fabien Chouteau

