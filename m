Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RseIw-0000IO-Pk
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2012 12:49:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:55338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RseIp-0008LN-No
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 12:49:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RseIl-0004v1-Gi
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 12:49:03 -0500
Received: from mail-pz0-f46.google.com ([209.85.210.46]:40371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RseIb-0004jc-1C; Wed, 01 Feb 2012 12:48:49 -0500
Received: by dadp15 with SMTP id p15so1530194dad.33
	for <multiple recipients>; Wed, 01 Feb 2012 09:48:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.68.211.198 with SMTP id ne6mr61797449pbc.83.1328118527473;
	Wed, 01 Feb 2012 09:48:47 -0800 (PST)
Received: by 10.68.25.138 with HTTP; Wed, 1 Feb 2012 09:48:47 -0800 (PST)
In-Reply-To: <CAFEAcA-2pM0YGGH_fsgofNmzd+rZMMhHMDc74G_VeRiH-AfUOg@mail.gmail.com>
References: <1326486589-12326-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA-2pM0YGGH_fsgofNmzd+rZMMhHMDc74G_VeRiH-AfUOg@mail.gmail.com>
Date: Wed, 1 Feb 2012 17:48:47 +0000
Message-ID: <CAFEAcA9F=2_G3BKjWc6qL6os4ZMC=mgXFSFkyazWxanftm3Oog@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.46
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [RFC] CODING_STYLE: Clarify style
 for enum and function type names
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
X-List-Received-Date: Wed, 01 Feb 2012 17:49:09 -0000

Ping^2 and cc'ing trivial.

-- PMM

On 23 January 2012 14:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> Since nobody seems to have disagreed, perhaps we should
> just commit this?
>
> -- PMM
>
> On 13 January 2012 20:29, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Clarify that enum type names and function type names should follow
>> the CamelCase style used for structured type names.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> During a conversation on IRC with Anthony, I realised that the coding
>> standard isn't entirely clear about what convention should be followed
>> for enum and function types. This patch resolves that by saying they
>> should be CamelCase like structured type names, based on Anthony's
>> suggestion. I've tagged this as an RFC in case anybody would rather
>> we went the other way instead...
>>
>> =C2=A0CODING_STYLE | =C2=A0 =C2=A03 ++-
>> =C2=A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/CODING_STYLE b/CODING_STYLE
>> index 6e61c49..7c82d4d 100644
>> --- a/CODING_STYLE
>> +++ b/CODING_STYLE
>> @@ -44,7 +44,8 @@ Rationale:
>> =C2=A03. Naming
>>
>> =C2=A0Variables are lower_case_with_underscores; easy to type and read. =
=C2=A0Structured
>> -type names are in CamelCase; harder to type but standing out. =C2=A0Sca=
lar type
>> +type names are in CamelCase; harder to type but standing out. =C2=A0Enu=
m type
>> +names and function type names should also be in CamelCase. =C2=A0Scalar=
 type
>> =C2=A0names are lower_case_with_underscores_ending_with_a_t, like the PO=
SIX
>> =C2=A0uint64_t and family. =C2=A0Note that this last convention contradi=
cts POSIX
>> =C2=A0and is therefore likely to be changed.
>> --
>> 1.7.1

