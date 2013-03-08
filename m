Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UDtUN-0002ct-J8
	for mharc-qemu-trivial@gnu.org; Fri, 08 Mar 2013 04:21:19 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtUF-0002aY-Ei
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UDtUA-0007n8-Bq
	for qemu-trivial@nongnu.org; Fri, 08 Mar 2013 04:21:11 -0500
Received: from mail-wi0-x231.google.com ([2a00:1450:400c:c05::231]:36694)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UDtUA-0007n3-5z; Fri, 08 Mar 2013 04:21:06 -0500
Received: by mail-wi0-f177.google.com with SMTP id hm14so768569wib.16
	for <multiple recipients>; Fri, 08 Mar 2013 01:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=KCgPjENDNpmwOGxHx/+4jpiurBn7yitcOw2X+3Kfl90=;
	b=tl26lUcTTOqymwy624XOpHgQK+7iLY+YO/aX8bWNYgjT3UdDg+/1N0ADBh8Qu7idW+
	7IohCIV+zGM7ANbqYhw9iOBQCXFU1tTT0ZUSkUKOdTaV0aKIcg9Ba4ElkUuYHdBpsbEb
	ThP2tK8gT6OwjbUwcItzSqXydYHtW5MIV6RbvIXlI2hGikp4NZUyyUUFV/4MBqH4Gf8v
	pqEA6qbw9V5GWvPQDxhHSIZPepX7Xi1tG08uIKUTolPx2ISxNeZ5ZSws0QSa0fiUkf3k
	NZw3q51jrhtrMeKbbqH9C0Duv7e6SFqRZfDIxR6hUiDiK8W3zv3Q7Go+DvrbdDpx7EzV
	/SlQ==
X-Received: by 10.180.82.33 with SMTP id f1mr38734601wiy.13.1362734465440;
	Fri, 08 Mar 2013 01:21:05 -0800 (PST)
Received: from localhost ([2a02:810d:ec0:195:852b:b477:8102:5356])
	by mx.google.com with ESMTPS id fv2sm8177827wib.6.2013.03.08.01.21.03
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 08 Mar 2013 01:21:04 -0800 (PST)
Date: Fri, 8 Mar 2013 10:21:02 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7IChXZWktUmVuIENoZW4p?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20130308092102.GD9597@stefanha-thinkpad.redhat.com>
References: <20130307033301.GA48996@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20130307033301.GA48996@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Use proper term in TCG
	README
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
X-List-Received-Date: Fri, 08 Mar 2013 09:21:17 -0000

On Thu, Mar 07, 2013 at 11:33:01AM +0800, 陳韋任 (Wei-Ren Chen) wrote:
>   In TCG, "target" means the host architecture for which TCG generates the
> code. Using "guest" rather than "target" to make the document more consistent.
> 
> Signed-off-by: Chen Wei-Ren <chenwj@iis.sinica.edu.tw>
> ---
>  tcg/README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/README b/tcg/README
> index 934e7af..22174c0 100644
> --- a/tcg/README
> +++ b/tcg/README
> @@ -379,7 +379,7 @@ double-word product T0.  The later is returned in two single-word outputs.
>  
>  Similar to mulu2, except the two inputs T1 and T2 are signed.
>  
> -********* 64-bit target on 32-bit host support
> +********* 64-bit guest on 32-bit host support
>  
>  The following opcodes are internal to TCG.  Thus they are to be implemented by
>  32-bit host code generators, but are not to be emitted by guest translators.

Review from TCG experts please.

It seems we have multiple meanings for "target" (e.g. ./configure
--target-list= does not mean "the host architecture for which TCG
generates code"), if this is really the way TCG uses the term then fine.

Stefan

