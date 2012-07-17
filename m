Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sr9kF-0003gO-Ml
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 11:31:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Sr9k8-0003dj-IJ
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 11:31:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Sr9k7-0004rT-49
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 11:31:20 -0400
Received: from goliath.siemens.de ([192.35.17.28]:23429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1Sr9k6-0004r8-RC; Tue, 17 Jul 2012 11:31:19 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q6HFVG1O004111;
	Tue, 17 Jul 2012 17:31:16 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q6HFVFlN009146;
	Tue, 17 Jul 2012 17:31:15 +0200
Message-ID: <50058543.7090305@siemens.com>
Date: Tue, 17 Jul 2012 17:31:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <50058375.5080009@siemens.com>
	<CAFEAcA_j=4N5M5uH5-+KamBb-7pf5Qzk_m_C+NqeTn1303TTmA@mail.gmail.com>
In-Reply-To: <CAFEAcA_j=4N5M5uH5-+KamBb-7pf5Qzk_m_C+NqeTn1303TTmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Stop saving/restoring
	cpu_single_env
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
X-List-Received-Date: Tue, 17 Jul 2012 15:31:26 -0000

On 2012-07-17 17:27, Peter Maydell wrote:
> On 17 July 2012 16:23, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>> This variable is now thread-local, so cannot change anymore while
>> dropping the global mutex.
> 
> This isn't true on any host except Linux, and run_on_cpu() isn't
> inside a !_WIN32 ifdef as far as I can tell.

Err, yes, forgot that minor detail. It would also break on non-Linux Unixes.

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SDP-DE
Corporate Competence Center Embedded Linux

