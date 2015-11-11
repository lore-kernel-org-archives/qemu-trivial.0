Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwVT3-0002PP-8w
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2015 08:29:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwVSw-0002Fp-3i
	for qemu-trivial@nongnu.org; Wed, 11 Nov 2015 08:29:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZwVSs-0001qo-Ay
	for qemu-trivial@nongnu.org; Wed, 11 Nov 2015 08:29:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZwVSl-0001ou-PM; Wed, 11 Nov 2015 08:29:23 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 93196C0AAB31;
	Wed, 11 Nov 2015 13:29:22 +0000 (UTC)
Received: from [10.36.5.130] (vpn1-5-130.ams2.redhat.com [10.36.5.130])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tABDTJ57021701
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 11 Nov 2015 08:29:20 -0500
To: Cornelia Huck <cornelia.huck@de.ibm.com>
References: <1447186571-27672-1-git-send-email-thuth@redhat.com>
	<1447186571-27672-4-git-send-email-thuth@redhat.com>
	<20151111122503.1e445227.cornelia.huck@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <564342AE.5090604@redhat.com>
Date: Wed, 11 Nov 2015 14:29:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151111122503.1e445227.cornelia.huck@de.ibm.com>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] hw/s390x: Remove
 superfluous return statements
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
X-List-Received-Date: Wed, 11 Nov 2015 13:29:39 -0000

On 11/11/15 12:25, Cornelia Huck wrote:
> On Tue, 10 Nov 2015 21:16:10 +0100
> Thomas Huth <thuth@redhat.com> wrote:
>=20
>> The "return;" statements at the end of functions do not make
>> much sense, so let's remove them.
>>
>> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: Alexander Graf <agraf@suse.de>
>> Cc: Richard Henderson <rth@twiddle.net>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/s390x/css.c            |  1 -
>>  hw/s390x/event-facility.c | 21 ++++++---------------
>>  hw/s390x/s390-pci-bus.c   |  4 ----
>>  3 files changed, 6 insertions(+), 20 deletions(-)
>>
>=20
> Ack for the css and pci parts.
>=20
> The sclp parts, however, switch from "one point of exit" to "immediate
> exit", and I'm not sure I like that; not sure enough anyway to apply
> this patch.

Ah, right, I remember, you're prefering gotos ... well, no, I won't
start a discussion about that here again ;-) ... so feel free to remove
these hunks or simply ignore the patch completely.

 Cheers,
  Thomas



