Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmIAT-00068T-Fp
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 03:39:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WmIAK-0005yH-EO
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:39:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1WmIAC-0004OQ-Sx
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 03:39:20 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:36534)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1WmI9x-0004Nt-OX; Mon, 19 May 2014 03:38:57 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id BF401104E4C;
	Mon, 19 May 2014 09:38:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Ta4vK4hN7ib9; Mon, 19 May 2014 09:38:55 +0200 (CEST)
Received: from [134.155.36.73] (edv13.bib.uni-mannheim.de [134.155.36.73])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 99F5F104E38;
	Mon, 19 May 2014 09:38:55 +0200 (CEST)
Message-ID: <5379B510.6000907@weilnetz.de>
Date: Mon, 19 May 2014 09:38:56 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Gerd Hoffmann <kraxel@redhat.com>
References: <1400336958-32463-1-git-send-email-sw@weilnetz.de>
	<1400480365.32155.21.camel@nilsson.home.kraxel.org>
In-Reply-To: <1400480365.32155.21.camel@nilsson.home.kraxel.org>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.80
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Automatically
 select GTK+ 3.0 if GTK+ 2.0 is unavailable
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
X-List-Received-Date: Mon, 19 May 2014 07:39:28 -0000

Am 19.05.2014 08:19, schrieb Gerd Hoffmann:
>   Hi,
>
>> +if test "$gtkabi" = ""; then
>> +    # The GTK ABI was not specified explicitly, so try whether 2.0 is available.
>> +    # Use 3.0 as a fallback if that is available.
>> +    if $pkg_config --exists "gtk+-2.0 >= 2.18.0"; then
>> +        gtkabi=2.0
>> +    elif $pkg_config --exists "gtk+-3.0 >= 3.0.0"; then
>> +        gtkabi=3.0
>> +    else
>> +        gtkabi=2.0
>> +    fi
>> +fi
> Shouldn't we probe for gtk3 first?
>
> cheers,
>   Gerd

That sounds reasonable, but would result in a non trivial change for all
developers who build on a system with both GTK versions. I tried to
preserve the current default (2.0) as far as possible.

Stefan

