Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBQ8n-0006O2-Jo
	for mharc-qemu-trivial@gnu.org; Mon, 19 Aug 2013 10:09:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBQ8h-0006HG-Vu
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 10:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chouteau@adacore.com>) id 1VBQ8d-00061H-De
	for qemu-trivial@nongnu.org; Mon, 19 Aug 2013 10:08:59 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:33483
	helo=smtp.eu.adacore.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chouteau@adacore.com>)
	id 1VBQ8U-0005zJ-Av; Mon, 19 Aug 2013 10:08:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 41F8A265C28A;
	Mon, 19 Aug 2013 16:08:15 +0200 (CEST)
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3buxAmHriX8; Mon, 19 Aug 2013 16:08:15 +0200 (CEST)
Received: from [10.10.1.88] (pompomgalli.act-europe.fr [10.10.1.88])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 04ED6265B47A;
	Mon, 19 Aug 2013 16:08:15 +0200 (CEST)
Message-ID: <521226CF.4050202@adacore.com>
Date: Mon, 19 Aug 2013 16:08:15 +0200
From: Fabien Chouteau <chouteau@adacore.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1375447708-14545-1-git-send-email-chouteau@adacore.com>
	<CAFEAcA_yfEtT=JXfa56A8Fa1a=yHMY8NPdPf02j=f+8Fqfjzjg@mail.gmail.com>
In-Reply-To: <CAFEAcA_yfEtT=JXfa56A8Fa1a=yHMY8NPdPf02j=f+8Fqfjzjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 194.98.77.210
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Improve Monitor disas
	with symbol lookup
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
X-List-Received-Date: Mon, 19 Aug 2013 14:09:04 -0000

On 08/19/2013 10:33 AM, Peter Maydell wrote:
> On 2 August 2013 13:48, Fabien Chouteau <chouteau@adacore.com> wrote:
>> Part of M731-018.
> 
> What is this a reference to?
> 

I'm sorry this is not supposed to be here. Do you have comments before I
resend the patch?

Regards,

-- 
Fabien Chouteau

