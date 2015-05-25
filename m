Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx1T4-0003w7-Ic
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 19:07:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Yx1T2-0003sK-2s
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 19:07:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Yx1T1-0004k6-6i
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 19:07:32 -0400
Received: from cantor2.suse.de ([195.135.220.15]:33748 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1Yx1Sw-0004jZ-Si; Mon, 25 May 2015 19:07:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E7141AAC1;
	Mon, 25 May 2015 23:07:25 +0000 (UTC)
Message-ID: <5563AB2D.9050400@suse.de>
Date: Tue, 26 May 2015 01:07:25 +0200
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>, qemu-devel@nongnu.org
References: <1432498814-1469-1-git-send-email-crosthwaite.peter@gmail.com>
	<55638A0C.1000902@suse.de> <5563A9C5.1000603@redhat.com>
In-Reply-To: <5563A9C5.1000603@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, afaerber@suse.de,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH v2] device-tree: Make a common-obj
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
X-List-Received-Date: Mon, 25 May 2015 23:07:33 -0000



On 26.05.15 01:01, Paolo Bonzini wrote:
>=20
>=20
> On 25/05/2015 22:46, Alexander Graf wrote:
>>
>> On 24.05.15 22:20, Peter Crosthwaite wrote:
>>>> There is no reason for device tree API to be built per-target.
>>>> common-obj it. There is an extraneous inclusion of config.h that
>>>> needs to be removed.
>>>>
>>>> Cc: Alexander Graf <agraf@suse.de>
>>>> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
>>>> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
>> Doesn't this mean that we're now linking against libfdt on
>> qemu-system-x86_64?
>=20
> We already are.

Oh :(


Alex

