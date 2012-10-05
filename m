Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TKEQz-0000HB-1l
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 16:23:45 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43087)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TKEQw-00009w-VP
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 16:23:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1TKEQw-0005wt-50
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 16:23:42 -0400
Received: from cantor2.suse.de ([195.135.220.15]:44755 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1TKEQu-0005wa-9L; Fri, 05 Oct 2012 16:23:40 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 66561A329B;
	Fri,  5 Oct 2012 22:23:39 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1349456942-31836-1-git-send-email-peter.maydell@linaro.org>
Date: Fri, 5 Oct 2012 22:23:35 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC7BCD67-B2F1-49EC-BD34-624195D9FC02@suse.de>
References: <1349456942-31836-1-git-send-email-peter.maydell@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Avi Kivity <avi@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] Remove TARGET_PHYS_ADDR_BITS define
	completely
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
X-List-Received-Date: Fri, 05 Oct 2012 20:23:44 -0000


On 05.10.2012, at 19:09, Peter Maydell wrote:

> Following commit 4be403c81 TARGET_PHYS_ADDR_BITS is always 64,
> and it's only used in one place (that commit removed all the
> other uses). Remove it completely, to avoid confusion with
> the genuinely useful TARGET_PHYS_ADDR_SPACE_BITS.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Thanks, applied to ppc-next

(But I wouldn't mind it going through trivial either. Whoever sends a =
pull request first ...)


Alex


