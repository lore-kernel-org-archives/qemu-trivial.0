Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RyLUh-0001be-E2
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2012 05:56:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RyLUa-00019B-8o
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 05:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RyLUW-0000ZU-Br
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2012 05:56:44 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:57780)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RyLUM-0000Y6-9e; Fri, 17 Feb 2012 05:56:30 -0500
Received: by iahk25 with SMTP id k25so4889817iah.4
	for <multiple recipients>; Fri, 17 Feb 2012 02:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=wXpjYLARKYnmpzihPAchne/fZit9K10XiuTG9w+EZ3E=;
	b=A8ZY1nS+ILHIb9w0rEEyesiyDUz/b39bLrV832Hou9qsvFddE0d6NeHJ1xeWr757wU
	vwBaJ4pwhziQP+GAdTHpey3tHTJ/9JBT3u3EiU2SUanmu+ukG8WzS2++zW2CQafwMDrl
	9/ZlP1czWTFKPcvMLK86vTjNknW3GUVLk7EUM=
MIME-Version: 1.0
Received: by 10.42.155.5 with SMTP id s5mr6409968icw.13.1329476189682; Fri, 17
	Feb 2012 02:56:29 -0800 (PST)
Received: by 10.231.187.84 with HTTP; Fri, 17 Feb 2012 02:56:29 -0800 (PST)
In-Reply-To: <CAFEAcA_YhqH6Nq4JNhZDcR3mrE0UvONGL+Q2dEvtL2UbXVpbbQ@mail.gmail.com>
References: <4F3D3EB1.6090003@mentor.com>
	<CAFEAcA_YhqH6Nq4JNhZDcR3mrE0UvONGL+Q2dEvtL2UbXVpbbQ@mail.gmail.com>
Date: Fri, 17 Feb 2012 10:56:29 +0000
Message-ID: <CAJSP0QV8FbeyR5DDcNmmWEkkFFy5mqRSOFAz0dcK0udS+2MUbQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] [TRIVIAL] Removed unused
	pl080_init().
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
X-List-Received-Date: Fri, 17 Feb 2012 10:56:49 -0000

On Thu, Feb 16, 2012 at 6:11 PM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 16 February 2012 17:36, Alexander Barabash
> <alexander_barabash@mentor.com> wrote:
>>
>> =A0 =A0Removed unused pl080_init().
>
> I posted the equivalent of this patch recently and it is in
> arm-devs.next -- please don't commit to qemu-trivial.

Okay.

Stefan

