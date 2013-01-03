Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TqaLY-00075d-Aj
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2013 21:15:52 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TqaLU-00072w-VK
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 21:15:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TqaLS-0001lj-VA
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 21:15:48 -0500
Received: from e7.ny.us.ibm.com ([32.97.182.137]:46689)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TqaLS-0001lR-G7
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 21:15:46 -0500
Received: from /spool/local
	by e7.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Wed, 2 Jan 2013 21:15:45 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e7.ny.us.ibm.com (192.168.1.107) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 2 Jan 2013 21:15:44 -0500
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 0EC7EC90045;
	Wed,  2 Jan 2013 21:15:44 -0500 (EST)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r032Fhku25755714; Wed, 2 Jan 2013 21:15:43 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r032Fh2P025328; Wed, 2 Jan 2013 21:15:43 -0500
Received: from titi.na.relay.ibm.com (sig-9-65-32-54.mts.ibm.com [9.65.32.54])
	by d01av01.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r032Fe7L025211; Wed, 2 Jan 2013 21:15:41 -0500
From: Anthony Liguori <aliguori@us.ibm.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA86669ssq+5y8BLL6CBdZozjwKWmdKkQG1m=pFSn_JPTQ@mail.gmail.com>
References: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<201301030019.r030JT4H029920@d01av04.pok.ibm.com>
	<CAFEAcA86669ssq+5y8BLL6CBdZozjwKWmdKkQG1m=pFSn_JPTQ@mail.gmail.com>
User-Agent: Notmuch/0.13.2+93~ged93d79 (http://notmuchmail.org) Emacs/23.3.1
	(x86_64-pc-linux-gnu)
Date: Wed, 02 Jan 2013 20:15:39 -0600
Message-ID: <874nizui44.fsf@codemonkey.ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13010302-5806-0000-0000-00001DB64543
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.137
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] correct error message
	qemu-img reported
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
X-List-Received-Date: Thu, 03 Jan 2013 02:15:50 -0000

Peter Maydell <peter.maydell@linaro.org> writes:

> On 3 January 2013 00:19, Anthony Liguori <aliguori@us.ibm.com> wrote:
>> This is an automated message generated from the QEMU Patches.
>> Thank you for submitting this patch.  This patch no longer applies to qemu.git.
>
>> Nacked-by: QEMU Patches <aliguori@us.ibm.com>
>
> Are we going to get these emails on every old patch that was
> superseded by a later fixed version 2?

Nope.

Patches detects obsoleted patches and ignores them.  It also detects
patches that have been committed in submaintainer trees but have not yet
made there way into qemu.git.

Regards,

Anthony Liguori

>
> -- PMM


