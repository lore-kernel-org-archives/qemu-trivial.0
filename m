Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axXKh-0000RL-CE
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 06:13:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1axXKX-00008C-QC
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 06:13:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1axXKM-00011N-6F
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 06:13:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35335)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1axXK4-0000r8-47; Tue, 03 May 2016 06:12:56 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F8F862662;
	Tue,  3 May 2016 10:12:39 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-34.ams2.redhat.com
	[10.36.116.34])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43ACcWW027482; Tue, 3 May 2016 06:12:39 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id C6BFA804C7; Tue,  3 May 2016 12:12:37 +0200 (CEST)
Message-ID: <1462270357.31362.1.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: haris iqbal <haris.phnx@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>
Date: Tue, 03 May 2016 12:12:37 +0200
In-Reply-To: <CAE_WKMx3p0MFJWOamHFgrqiP2pxqmG2hou+pOaVOQq66pMUtAg@mail.gmail.com>
References: <1459862499-4768-1-git-send-email-haris.phnx@gmail.com>
	<CAE_WKMx3p0MFJWOamHFgrqiP2pxqmG2hou+pOaVOQq66pMUtAg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 03 May 2016 10:12:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in ui/shader.c
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 03 May 2016 10:13:34 -0000

On Di, 2016-05-03 at 15:16 +0530, haris iqbal wrote:
> Just a reminder. waiting for a review for the previous patch.

Patch is fine.  Just stalled b/c we are in code freeze, I expect trivial
queue will pick this up for the 2.7 devel cycle.

cheers,
  Gerd


