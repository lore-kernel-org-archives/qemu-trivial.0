Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aePLI-0006R7-M2
	for mharc-qemu-trivial@gnu.org; Fri, 11 Mar 2016 10:51:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39011)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1aePLD-0006P1-FV
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 10:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1aePLA-0006IS-7e
	for qemu-trivial@nongnu.org; Fri, 11 Mar 2016 10:51:03 -0500
Received: from mail.uni-paderborn.de ([131.234.142.9]:54965)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1aePL9-0006II-S4; Fri, 11 Mar 2016 10:51:00 -0500
To: Siddharth Gupta <siddharthgupta04@gmail.com>, qemu-devel@nongnu.org
References: <CALwKnOgaM2AKdHX+tJ8vh17rh3Hdd4uqdVBCZ=su-Asi=0eL_A@mail.gmail.com>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <56E2E95F.1080901@mail.uni-paderborn.de>
Date: Fri, 11 Mar 2016 16:50:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CALwKnOgaM2AKdHX+tJ8vh17rh3Hdd4uqdVBCZ=su-Asi=0eL_A@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.2.1.2493963, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2016.3.11.154217
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 131.234.142.9
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] BitsSizedTasks-LargeFrames
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
X-List-Received-Date: Fri, 11 Mar 2016 15:51:07 -0000

Hi Siddharth,

thanks for the patch. Can you resend it inlined into the e-mail instead
of an attachment? I usually use git send-email for that.
My workflow (once you have configured git send-email) would be:

- git format-patch -1
- git send-email --to="qemu-devel@nongnu.org"
--cc="qemu-trivial@nongnu.org" *.patch

Also there is a page on the wiki on how to submit a patch [1]. If you
want to avoid a lot of re-sending you might want to look into it :).

Cheers,
Bastian

[1] http://wiki.qemu.org/Contribute/SubmitAPatch




