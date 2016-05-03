Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axU65-0004ys-VS
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 02:46:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOqM-0005ph-58
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1axOqA-00016l-9d
	for qemu-trivial@nongnu.org; Mon, 02 May 2016 21:09:36 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1axOq9-00011a-1d; Mon, 02 May 2016 21:09:30 -0400
Received: by mail-oi0-x241.google.com with SMTP id f63so542468oig.0;
	Mon, 02 May 2016 18:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g15Q6+LlHgfWKt/y2aUXZa9Tdpj3fji4e6gtZK77HBQ=;
	b=L7zZndc2dMo9nAxxeOayiUrTjg++vQH7rXjt/34O3afvA4qdGEYXv49tTsMGyji7Qm
	iwm3c+rFZJRSXu4SzC7TkurMTIKBZ0c2uaXwi5p64JczPyG/8FknlMvQ/Gpml6Nztnj2
	R24GjZdud5py7QeRV5bxFCDXaYG51glcBEeC8RMD+1LRUHO70H2kz14tWQe2GyzIXNtK
	UPjj40wtB69WTMtB6ALJ7FBVP4qV/bs/v1ebRkO/x/KJqihq+U/tnit8VsPFVQPAcwOs
	0bSXb6lri79DxVsytw+k60mhbQwuw/RGVeIUZYAB1KAW6eLbZw4EkwKJWHFzNG8XpCgN
	xRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g15Q6+LlHgfWKt/y2aUXZa9Tdpj3fji4e6gtZK77HBQ=;
	b=I0xa3msIdGluL9gZu2kYmKWC3tZNjGDCHKpZg6v9t6iwJ4HXgU0BCpW+16pctc1T1b
	GU3fJ0Jap1BOE0du+c1bGK+joGthXyi06u9VBwjQubkuogoMS+2Gp+hlBXTYtl8WjZiD
	Fh5A2rhJnklFhs+PdldOJKkcPdbuCzpeBQCWgtcBhYc8Hn5rfsqpmq1Bdw7Fqjk4su2j
	65EWXbg+/s5LC2Lg8e9JpxZxnY9xpSYkcMo6sansNMGqooUFxrINO2x0MWOp9krFzDaq
	XL66ZtEPRvEAFjVbmP6OyDwp66VQLnfWBoZgNlF8aVPXSC7CuaCu0+WFba2jciKsZqpP
	vVbA==
X-Gm-Message-State: AOPr4FXtl2uwb2WF8LMFBtbU1AAyhL6b5Hha4HUQlu+5dXZaR2AeWE3JGuyV0dNWFWmQx6RPxfhkun8aq6uN+Q==
X-Received: by 10.157.52.154 with SMTP id g26mr18040496otc.123.1462237737348; 
	Mon, 02 May 2016 18:08:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.4.120 with HTTP; Mon, 2 May 2016 18:08:38 -0700 (PDT)
In-Reply-To: <CAFEAcA-mDkoHwdz3+A7=pwSRNkPMCKgC6j0utHzQFs2VaqG6hA@mail.gmail.com>
References: <1462236478-61645-1-git-send-email-chrisfriedt@gmail.com>
	<1462236478-61645-2-git-send-email-chrisfriedt@gmail.com>
	<CAFEAcA-mDkoHwdz3+A7=pwSRNkPMCKgC6j0utHzQFs2VaqG6hA@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 2 May 2016 21:08:38 -0400
Message-ID: <CAF4BF-RHPnSSN-zmQr14Cc1_-K=OQD+fBOpQCnv7sU+8E0-Uvw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Fam Zheng <famz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
X-Mailman-Approved-At: Tue, 03 May 2016 02:46:17 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] Use libtool instead of
 ar to create static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 01:09:48 -0000

On Mon, May 2, 2016 at 8:53 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 3 May 2016 at 01:47, Christopher Friedt <chrisfriedt@gmail.com> wrote:
>>
>> Currently, at least on Mac OS X 10.11.4 (El Capitan), Qemu fails
>> to build for a few reasons.
>
> I guess this is a new-in-ElCapitan thing? I run Yosemite, which is
> fine.

I think you're partially correct, although the information on the man page dates
back to at least Snow Leopard (10.6.2) [1], so Apple has preferred the
libtool method for a very long time.

It's possible that it only finally broke in El Capitan.

[1] http://www.unix.com/man-page/osx/1/libtool/

