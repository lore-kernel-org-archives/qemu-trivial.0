Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkK45-00051A-Re
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 16:12:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UkK3y-0004rx-OV
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 16:12:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1UkK3s-0001G6-Dc
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 16:12:06 -0400
Received: from mail-qc0-x234.google.com ([2607:f8b0:400d:c01::234]:53686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1UkK3f-0001EZ-TF; Wed, 05 Jun 2013 16:11:47 -0400
Received: by mail-qc0-f180.google.com with SMTP id a10so1199141qcx.11
	for <multiple recipients>; Wed, 05 Jun 2013 13:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=wAvhYeW1ccvSNdMScnwHQQM7Pj191fPHQKQibBADuVc=;
	b=z6X8OYo7lFEkeRBuBtAQFcSO+xlvgRDNH3wrjpxFEDRlg9rwFXvUJA9W5sCK5FT4Mc
	ZtZYBJL0mhoCKmmR3gmo09eyyKtANtW21cEjI9uxc93aZzwNN0FAjlcO3PmRddJrhG7t
	vcqVqTw5mkaAEGLKiCb0V+uFyEiFtneX6Z76cTl2PSva8f9QbUynTlSz5KukweAa6gUX
	fQIDLtx9NyROAj0+Hfz2/p4wNWGSM5alPo6RuDFBT8l0ZYy3Ygx4lNcbIPu+fr5+VkrF
	R7ZLntpg/vkmla02xt9HHfyjj/U22nry7kjLZjYOPaDUAS9NFooG6mpcRZOEmUltsR07
	oX9A==
MIME-Version: 1.0
X-Received: by 10.224.16.5 with SMTP id m5mr30849952qaa.90.1370463107588; Wed,
	05 Jun 2013 13:11:47 -0700 (PDT)
Sender: carpeddiem@gmail.com
Received: by 10.224.12.17 with HTTP; Wed, 5 Jun 2013 13:11:47 -0700 (PDT)
In-Reply-To: <51AF9984.8030103@msgid.tls.msk.ru>
References: <1370444532-68682-1-git-send-email-emaste@freebsd.org>
	<51AF9984.8030103@msgid.tls.msk.ru>
Date: Wed, 5 Jun 2013 16:11:47 -0400
X-Google-Sender-Auth: 9hfSUzE_xBr87H_t26ycWCqCLoU
Message-ID: <CAPyFy2AKJamU2gtY1+N9-EyL7N4TzjY5HPMPsQjaA5tRHo0jVw@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c01::234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Use ${config_host_ld} variable
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
X-List-Received-Date: Wed, 05 Jun 2013 20:12:12 -0000

On 5 June 2013 16:03, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 05.06.2013 19:02, Ed Maste wrote:
>> -  linker_script="-Wl,-T../config-host.ld -Wl,-T,\$(SRC_PATH)/ldscripts/\$(ARCH).ld"
>> +  linker_script="-Wl,-T../${config_host_ld} -Wl,-T,\$(SRC_PATH)/ldscripts/\$(ARCH).ld"
>
> Do we really care?  To me it looks like it is better
> to just remove the variable (which is nothing but just
> an extra indirection) and be done with it.

I don't really care one way or another, and am happy to expand the
other uses of it if that's preferred; it just seems odd to me to use
the variable in one spot and the literal filename in another.

(I found this while doing a little cleanup in preparation to avoid use
of the ldscripts/ files on FreeBSD.)

