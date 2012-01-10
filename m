Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RkfVy-00056P-8c
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jan 2012 12:29:38 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balrogg@gmail.com>) id 1RkfVq-0004xn-Ul
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2012 12:29:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balrogg@gmail.com>) id 1RkfVm-0001qB-T4
	for qemu-trivial@nongnu.org; Tue, 10 Jan 2012 12:29:30 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:35724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balrogg@gmail.com>)
	id 1RkfVk-0001pY-GU; Tue, 10 Jan 2012 12:29:24 -0500
Received: by qcsd15 with SMTP id d15so3009405qcs.4
	for <multiple recipients>; Tue, 10 Jan 2012 09:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:reply-to:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=4tV4UFFw6/4R7EIYH5dufYSblphYpGEJ6tRX2Iyi0YY=;
	b=EHemgc5UXMa/f+IpHr7317E8ZmXOP3ZZVRpddgu2rUEbRI4qgLki0VU0uXlmm24vLt
	onbngUxjWPZgnHA8+voTn7guxiLwkPHnAJ+XNFNSggb0KdEi/sQfe1OgN3SpK/d3iygg
	jQhJGCGDmJJYFZFrlGhJAh20VC8KAFa5N2mCc=
MIME-Version: 1.0
Received: by 10.224.177.132 with SMTP id bi4mr25638329qab.79.1326216563958;
	Tue, 10 Jan 2012 09:29:23 -0800 (PST)
Sender: balrogg@gmail.com
Received: by 10.224.89.65 with HTTP; Tue, 10 Jan 2012 09:29:23 -0800 (PST)
In-Reply-To: <1325937599-12763-1-git-send-email-stefanha@linux.vnet.ibm.com>
References: <1325937599-12763-1-git-send-email-stefanha@linux.vnet.ibm.com>
Date: Tue, 10 Jan 2012 18:29:23 +0100
X-Google-Sender-Auth: USF55kMv1kzCxlFnEIpckONS0nM
Message-ID: <CAOq732LDP4aBZ3WAwz7ekVtTzhiTFM2kRw-nwXOHniUQ_CuLbg@mail.gmail.com>
From: andrzej zaborowski <balrog@zabor.org>
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] omap_dss: correct chip[1]
	index in RFBI_READ/RFBI_STATUS
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: balrogg@gmail.com
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jan 2012 17:29:36 -0000

On 7 January 2012 12:59, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com> wrot=
e:
> The RFBI_READ/RFBI_STATUS code incorrectly uses chip[0] when it should
> be using chip[1]. =C2=A0Andrzej Zaborowski <balrog@zabor.org> confirmed t=
his
> bug since I don't know this code well.
>
> Reported-by: Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

Reviewed-by: Andrzej Zaborowski <andrew.zaborowski@intel.com>

Cheers

