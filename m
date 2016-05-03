Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axfDF-0001CO-E0
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 14:38:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sbruno@freebsd.org>) id 1axeC0-0007Yj-Ba
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 13:33:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sbruno@freebsd.org>) id 1axeBf-0007Ea-G9
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 13:32:58 -0400
Received: from ignoranthack.me ([199.102.79.106]:60338
	helo=mail.ignoranthack.me) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sbruno@freebsd.org>)
	id 1axeBN-0006pT-D8; Tue, 03 May 2016 13:32:25 -0400
Received: from [192.168.200.206] (unknown [50.136.155.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: sbruno@ignoranthack.me)
	by mail.ignoranthack.me (Postfix) with ESMTPSA id B458E192928;
	Tue,  3 May 2016 17:32:08 +0000 (UTC)
To: haris iqbal <haris.phnx@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <1459861743-4514-1-git-send-email-haris.phnx@gmail.com>
	<CAE_WKMyO1LjEZ_T5-O7=X=MOpSe7AqTeXTOOkfiZ114bGjNeDQ@mail.gmail.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>
From: Sean Bruno <sbruno@freebsd.org>
Message-ID: <5728E097.1060507@freebsd.org>
Date: Tue, 3 May 2016 10:32:07 -0700
User-Agent: Mozilla/5.0 (X11; FreeBSD amd64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAE_WKMyO1LjEZ_T5-O7=X=MOpSe7AqTeXTOOkfiZ114bGjNeDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 199.102.79.106
X-Mailman-Approved-At: Tue, 03 May 2016 14:38:22 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to
 g_malloc, free to g_free in bsd-user/qemu.h
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
X-List-Received-Date: Tue, 03 May 2016 17:33:11 -0000

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512



On 05/03/16 02:45, haris iqbal wrote:
> Just a reminder. waiting for a review for the previous patch.
> 
> On Tue, Apr 5, 2016 at 6:39 PM, Md Haris Iqbal
> <haris.phnx@gmail.com> wrote:
>> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com> --- 
>> bsd-user/qemu.h | 4 ++-- 1 file changed, 2 insertions(+), 2
>> deletions(-)
>> 
>> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h index
>> 03b502a..5fac42e 100644 --- a/bsd-user/qemu.h +++
>> b/bsd-user/qemu.h @@ -357,7 +357,7 @@ static inline void
>> *lock_user(int type, abi_ulong guest_addr, long len, int copy 
>> #ifdef DEBUG_REMAP { void *addr; -        addr = malloc(len); +
>> addr = g_malloc(len); if (copy) memcpy(addr, g2h(guest_addr),
>> len); else @@ -383,7 +383,7 @@ static inline void
>> unlock_user(void *host_ptr, abi_ulong guest_addr, return; if (len
>> > 0) memcpy(g2h(guest_addr), host_ptr, len); -
>> free(host_ptr); +    g_free(host_ptr); #endif }
>> 
>> -- 1.9.1
>> 
> 
> 
> 

If this is the only patch needing review for the bsd-user code, please
put me down as Reviewed by.

Reviewed-by: Sean Bruno <sbruno@freebsd.org>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQF8BAEBCgBmBQJXKOCTXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCQUFENDYzMkU3MTIxREU4RDIwOTk3REQx
MjAxRUZDQTFFNzI3RTY0AAoJEBIB78oecn5kZE0H/06zauEdcv8Y0K3KI3r2ioFS
M6nqr/UXjqazqIeArBKDC+cnv47cnwH/x6Udn2on+CY9kR91QyUeG/DKUJdEp6Hs
idUuTf3L0W8nhNUUXE9bwVI7H2KWpDzHJ52dnHuSXaQZnBE6Q1AFk0ge+hg+XcCU
BsOqEkTAcxchOnvQJgNpMyXofI35QvSXqqaijTozMdGT7iHG0nKpO6KNW11ash2U
YEVNs9nkr9I+B+qKPhhgX+v4dAuHSekaEstWbkqqSa4YsmqIylL1MNTpRTbEUSEG
fScXKCOy3lANGV6u1sTzLIffR6N3WhkaYCuzYsQ7TQL/TAuYpBrQq7TQt8lb0Do=
=qmUg
-----END PGP SIGNATURE-----

