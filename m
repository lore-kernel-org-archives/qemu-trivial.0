Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TqYXT-0008NA-Hc
	for mharc-qemu-trivial@gnu.org; Wed, 02 Jan 2013 19:20:03 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TqYXP-0008D6-GT
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 19:20:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TqYXN-0008An-45
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 19:19:59 -0500
Received: from e8.ny.us.ibm.com ([32.97.182.138]:44223)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aliguori@us.ibm.com>) id 1TqYXM-0008AS-M6
	for qemu-trivial@nongnu.org; Wed, 02 Jan 2013 19:19:56 -0500
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <aliguori@us.ibm.com>;
	Wed, 2 Jan 2013 19:19:56 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
	by e8.ny.us.ibm.com (192.168.1.108) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 2 Jan 2013 19:19:41 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by d01dlp02.pok.ibm.com (Postfix) with ESMTP id B05E46E803A;
	Wed,  2 Jan 2013 19:19:33 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r030JYO4312280; Wed, 2 Jan 2013 19:19:34 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r030JV4c030040; Wed, 2 Jan 2013 19:19:33 -0500
Received: from ccnode4.phx.austin.ibm.com (ltcphx.austin.ibm.com [9.3.189.26])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r030JT4H029920; Wed, 2 Jan 2013 19:19:29 -0500
Message-Id: <201301030019.r030JT4H029920@d01av04.pok.ibm.com>
From: Anthony Liguori <aliguori@us.ibm.com>
To: liguang <lig.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org
In-Reply-To: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
Date: Thu, 03 Jan 2013 00:19:54 -0000
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13010300-9360-0000-0000-00000EAE0622
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.138
Cc: qemu-trivial@nongnu.org, liguang <lig.fnst@cn.fujitsu.com>
Subject: Re: [Qemu-trivial] [PATCH v4] correct error message qemu-img
	reported
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
X-List-Received-Date: Thu, 03 Jan 2013 00:20:01 -0000

Hi,

This is an automated message generated from the QEMU Patches.
Thank you for submitting this patch.  This patch no longer applies to qemu.git.

This may have occurred due to:
 
  1) Changes in mainline requiring your patch to be rebased and re-tested.

  2) Sending the mail using a tool other than git-send-email.  Please use
     git-send-email to send patches to QEMU.

  3) Basing this patch off of a branch that isn't tracking the QEMU
     master branch.  If that was done purposefully, please include the name
     of the tree in the subject line in the future to prevent this message.

     For instance: "[PATCH block-next 1/10] qcow3: add fancy new feature"

  4) You no longer wish for this patch to be applied to QEMU.  No additional
     action is required on your part.

Nacked-by: QEMU Patches <aliguori@us.ibm.com>

Below is the output from git-am:

    Applying: correct error message qemu-img reported
    Using index info to reconstruct a base tree...
    M	qemu-img.c
    Falling back to patching base and 3-way merge...
    Auto-merging qemu-img.c
    CONFLICT (content): Merge conflict in qemu-img.c
    Failed to merge in the changes.
    Patch failed at 0001 correct error message qemu-img reported
    The copy of the patch that failed is found in:
       /home/aliguori/patches/qemu.git/.git/rebase-apply/patch
    When you have resolved this problem run "git am --resolved".
    If you would prefer to skip this patch, instead run "git am --skip".
    To restore the original branch and stop patching run "git am --abort".


