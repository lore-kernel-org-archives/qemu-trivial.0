Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V9dKu-0005G3-Rt
	for mharc-qemu-trivial@gnu.org; Wed, 14 Aug 2013 11:50:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9dKm-0004t8-Vh
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 11:50:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>) id 1V9dKf-00076a-ND
	for qemu-trivial@nongnu.org; Wed, 14 Aug 2013 11:50:04 -0400
Received: from mail-wi0-x229.google.com ([2a00:1450:400c:c05::229]:50684)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <taimoor.mrza@gmail.com>)
	id 1V9dKV-00074y-QG; Wed, 14 Aug 2013 11:49:47 -0400
Received: by mail-wi0-f169.google.com with SMTP id f14so1873938wiw.0
	for <multiple recipients>; Wed, 14 Aug 2013 08:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LpZ/rVi5Z0HzlbShFXL/HhiYVZVUH5ByXY++zjKV3EQ=;
	b=SqyIELaMlPrkMYXnMQb/jRGNkaf143cuKmUGPDpYYIQG0r/1ZMxOEsER5Ez/6M67OP
	Zi8Vr9hEtGPm969bO+BrEopqTL+dyo4NK4av8qX8l/XMM5hNebWvGXGDWoTMQnSndQvL
	M0NBCBg170e1cxE34VTXZ8pkJ4prg6JcBM4yuSl1EELY/yNV1SHjHdoEIeOytQNJrZNL
	qXa8tasVElJuRdo0S29e/GI5T8IfqgQLoss+X+LOuWpeaNdB2zoN5iruzdL+9g5kzYfl
	fU9Hg7t4d8Ry8GqSSMD4Cnj2REWw4kI8ytbqNE2V8B8prfzt4T2qNwfjftyglVEubTpQ
	7ivg==
MIME-Version: 1.0
X-Received: by 10.180.77.164 with SMTP id t4mr2460908wiw.58.1376495386352;
	Wed, 14 Aug 2013 08:49:46 -0700 (PDT)
Received: by 10.194.24.161 with HTTP; Wed, 14 Aug 2013 08:49:46 -0700 (PDT)
In-Reply-To: <520AA338.2010408@redhat.com>
References: <1376424027-26208-1-git-send-email-tmirza@codesourcery.com>
	<1376427925-26767-1-git-send-email-tmirza@codesourcery.com>
	<520AA338.2010408@redhat.com>
Date: Wed, 14 Aug 2013 20:49:46 +0500
Message-ID: <CAO6-N=biX38qFJjH5OjUE=XXnB22k+igutDq+gzhhd=kP6XBLA@mail.gmail.com>
From: Taimoor Mirza <taimoor.mrza@gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::229
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Taimoor Mirza <tmirza@codesourcery.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp: Port redirection
 option behave differently on Linux and Windows
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
X-List-Received-Date: Wed, 14 Aug 2013 15:50:12 -0000

On Wed, Aug 14, 2013 at 2:20 AM, Eric Blake <eblake@redhat.com> wrote:
> On 08/13/2013 03:05 PM, Taimoor wrote:
>> From: Taimoor Mirza <tmirza@codesourcery.com>
>>
>> port redirection code uses SO_REUSEADDR socket option before binding to
>> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
>> Relaunching QEMU with same host and guest port redirection values on Linux
>> throws error but on Windows it does not throw any error.
>> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html
>
> When resending a patch, please use a v2 in the subject line (git
> send-email --subject-prefix PATCHv2), send as a top-level thread, and
> include a changelog after the --- divider that explains what changed
> from v1.  See http://wiki.qemu.org/Contribute/SubmitAPatch for more hints.


Thanks Eric. Should I resend with changelog of v2 and v2 in subject line?
>
> --
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
>

