Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b0SPd-0002Yy-SV
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2016 07:34:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1b0SPZ-0002N1-ND
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 07:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1b0SPX-0008Ul-Oh
	for qemu-trivial@nongnu.org; Wed, 11 May 2016 07:34:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52677)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1b0SPQ-0008Q7-6f; Wed, 11 May 2016 07:34:32 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DB90080E4A;
	Wed, 11 May 2016 11:34:30 +0000 (UTC)
Received: from nilsson.home.kraxel.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4BBYTY8013471; Wed, 11 May 2016 07:34:30 -0400
Received: by nilsson.home.kraxel.org (Postfix, from userid 500)
	id 3EEA982881; Wed, 11 May 2016 13:34:29 +0200 (CEST)
Message-ID: <1462966469.5679.36.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Md Haris Iqbal <haris.phnx@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 11 May 2016 13:34:29 +0200
In-Reply-To: <1459862499-4768-1-git-send-email-haris.phnx@gmail.com>
References: <1459862499-4768-1-git-send-email-haris.phnx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 11 May 2016 11:34:31 +0000 (UTC)
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
X-List-Received-Date: Wed, 11 May 2016 11:34:45 -0000

On Di, 2016-04-05 at 18:51 +0530, Md Haris Iqbal wrote:
> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>

Picked up for next ui pull request.

thanks,
  Gerd


