Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X54BU-0006GC-0a
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jul 2014 22:34:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X54BH-00068a-KP
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 22:34:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X54B8-0007BW-Jd
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 22:33:55 -0400
Received: from mail-pd0-x22b.google.com ([2607:f8b0:400e:c02::22b]:44015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1X54B8-0007BK-DE; Wed, 09 Jul 2014 22:33:46 -0400
Received: by mail-pd0-f171.google.com with SMTP id fp1so9998552pdb.16
	for <multiple recipients>; Wed, 09 Jul 2014 19:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=6f4S33JJQJb8dEhqp2r140Ju0dPufposmPPTxDGr4LM=;
	b=YNtL5ImaRj7dH3sXIyIuGtuWpTmRu1hxvcqNB3YXAfzuJhnGGP14oJHc8DM+YBleu1
	W5a8eeIUtU7sZeuD6AQ4UVcdUKrH+5RWUn2A8l7INWvZ/i9DmbFcXLvYZCHiI1WmeR8I
	rC+jM95lauAgXu9LuUtHr4erzTs+Mhp9AERWoYSoMXGFH5wI/xENv+oL5BKw4aAzPt/y
	nUuwI/gMiwPEJ1UAVNSgWbbKX9VwFq9e4eL8fW/Z8CuN/pmEoXTVTfcrOOPcwqzfA8pm
	e+TB/klfgmnqYtwIXtOpM+Bk+3GXN7a9GoL8bfPsqOCxrX7raV1tNc7/VKfUkCqde4+A
	b+Fw==
X-Received: by 10.68.125.164 with SMTP id mr4mr44479857pbb.27.1404959624833;
	Wed, 09 Jul 2014 19:33:44 -0700 (PDT)
Received: from [192.168.1.23] ([124.127.118.42])
	by mx.google.com with ESMTPSA id
	ue3sm60236307pbc.49.2014.07.09.19.33.27 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 09 Jul 2014 19:33:43 -0700 (PDT)
Message-ID: <53BDFB6C.8010409@gmail.com>
Date: Thu, 10 Jul 2014 10:33:16 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <53B57D5B.2070204@gmail.com> <53BD4A94.2000300@msgid.tls.msk.ru>
In-Reply-To: <53BD4A94.2000300@msgid.tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22b
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH trivial] qemu-img: Remove redundancy "ret
 = -1"
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
X-List-Received-Date: Thu, 10 Jul 2014 02:34:04 -0000


On 07/09/2014 09:58 PM, Michael Tokarev wrote:
> 03.07.2014 17:57, Chen Gang wrote:
>> In this case, 'ret' is already '-1', so need not do it again.
> 
> It's a very minor thing in an error path, maybe compiler even
> eliminates this statement entirely by its own already.
> 

Yeah, normal compiler with -O2, should eliminate it (maybe -O1 also OK).


> Not sure it is worth the effort but applied to the -trivial tree
> anyway, thanks!

For me, '-trivial' means none-urgent, but not mean minor (in fact some
of urgent things are minor), Coding-styles and trying to keep source
code simple are none-urgent, but not minor.

Normal things:

 - None-urgent and none-important things, we need not do -- it is just
   wasting members' time resources.

 - Urgent and none-important things, need process it in time.

 - None-urgent and important things, need process it when have time.

Special things:

 - For urgent and important things which can be separated:

   - need process for its' urgent part in time.

   - and then process for its important part when have time.

 - For urgent and important things which can not be separated:

   - air, water and life are in this case.

   - open, share, and attitude like air, water, and life.

   - God have already blessed, but we need let them better and better.


Welcome any suggestions, discussions and completions.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

