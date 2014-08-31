Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XO0Zj-0004Yc-25
	for mharc-qemu-trivial@gnu.org; Sun, 31 Aug 2014 04:33:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33508)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <qemu@mrs.ro>)
	id 1XO0Za-0004Nr-J6
	for qemu-trivial@nongnu.org; Sun, 31 Aug 2014 04:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <qemu@mrs.ro>) id 1XO0ZU-0007by-C5
	for qemu-trivial@nongnu.org; Sun, 31 Aug 2014 04:33:18 -0400
Received: from mrs.ro ([109.74.194.28]:48340)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <qemu@mrs.ro>)
	id 1XO0ZH-0007ZY-Oy; Sun, 31 Aug 2014 04:32:59 -0400
Received: from [192.168.1.4] (cs181218058.pp.htv.fi [82.181.218.58])
	by mrs.ro (Postfix) with ESMTPSA id D80DF6135;
	Sun, 31 Aug 2014 11:36:10 +0300 (EEST)
Message-ID: <5402DDB5.40400@mrs.ro>
Date: Sun, 31 Aug 2014 11:32:53 +0300
From: Valentin Manea <qemu@mrs.ro>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>, 
 Michael Tokarev <mjt@tls.msk.ru>
References: <53F704BE.6000407@mrs.ro> <53F9AF4D.10300@msgid.tls.msk.ru>
	<20140828111323.GI26741@stefanha-thinkpad.redhat.com>
In-Reply-To: <20140828111323.GI26741@stefanha-thinkpad.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 109.74.194.28
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
	Wenchao Xia <xiawenc@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] IDE: MMIO IDE device
 control should be little endian
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
X-List-Received-Date: Sun, 31 Aug 2014 08:33:25 -0000

On 2014-08-28 14:13, Stefan Hajnoczi wrote:
> Hi Valentin,
> Please resend the patch to qemu-devel@nongnu.org and CC Kevin Wolf
> <kwolf@redhat.com> and Stefan Hajnoczi <stefanha@redhat.com>.
> 
> All patches must go through the mailing list so the community has a
> chance to review and comment before a committer applies them.

Hi Stefan,

  Thanks for the tips, I have resent the patch.

Thanks,
Valentin


