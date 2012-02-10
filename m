Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvqWv-00072c-Re
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2012 08:28:49 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvqWp-0006it-1P
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 08:28:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvqWf-0007q1-UU
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 08:28:42 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:61429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>)
	id 1RvqWS-0007ln-1G; Fri, 10 Feb 2012 08:28:20 -0500
Received: by dadp14 with SMTP id p14so2670391dad.4
	for <multiple recipients>; Fri, 10 Feb 2012 05:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=QGRUhjaWQ51Iz3aBpSFQFBqG4mp/g8OHQVqKHy8rUoc=;
	b=KVUbtXusZHG7D2iOhE5a3o1pCAAY8wZxFN9SGPY7P+uGixUygs3x0M/ttuC6VPQ6bM
	g0KHGpV0H5lOhr3mWIPjSd5OPs/nu/tXyxEUsu3tS2HF2KBDcAbzhNcWtFC1YjKuR0YG
	+nSA3RpQq6+4ufBmpR7ElKIbpDhzWp3AeJk3U=
Received: by 10.68.226.98 with SMTP id rr2mr16043045pbc.115.1328880499120;
	Fri, 10 Feb 2012 05:28:19 -0800 (PST)
MIME-Version: 1.0
Sender: alex.barcelo@gmail.com
Received: by 10.142.208.6 with HTTP; Fri, 10 Feb 2012 05:27:59 -0800 (PST)
In-Reply-To: <201202101252.35754.paul@codesourcery.com>
References: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
	<CAFKAgTe-7hZ1U-CE5khEQ792VxsEayuWG6rCmR2F0uuHi7O1PQ@mail.gmail.com>
	<20120210082350.GB17878@stefanha-thinkpad.localdomain>
	<201202101252.35754.paul@codesourcery.com>
From: Alex Barcelo <abarcelo@ac.upc.edu>
Date: Fri, 10 Feb 2012 14:27:59 +0100
X-Google-Sender-Auth: uLHfVoQTx56j_x9aV7aCzbni-AY
Message-ID: <CAFKAgTcN3=SMX8MrLPEX+f84HESkfh162Vp+xLPh_onViU0JBA@mail.gmail.com>
To: Paul Brook <paul@codesourcery.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL] sas_ss_flags bug for
	powerpc
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
X-List-Received-Date: Fri, 10 Feb 2012 13:28:48 -0000

I have sent a v2 of this patch (renaming it, with a description and a
test case). If it's not trivial and I have to send it in another way,
I will do so.

Sorry for the inconvenience, as I said I'm new here and maybe I
misunderstood the "trivial" category.

