Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eA6r7-0003wA-5T
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 00:11:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6r5-0003vH-R7
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 00:11:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6r5-0001FA-0n
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 00:11:47 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:52475)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eA6r0-0001DC-Rc; Thu, 02 Nov 2017 00:11:42 -0400
Received: by mail-qk0-x244.google.com with SMTP id b15so5205795qkg.9;
	Wed, 01 Nov 2017 21:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tPoceqQDfXIUJEIF9jH+KeFIousiGvS9HlzWkIZ11h8=;
	b=j7X4XLbVm0PCHEjo0MrSI6QLnDuXukWvP1mgcNY1/uoSX6lI+SOKrtwHdg8EfaeHC8
	TefV7Iw5oQ8J3OTmGXD6VFsX55pUtmmi5tjgPMYXXYp5fclsdts03rWj8dHiK0bqvwiB
	3P3wElwL3easOjC8E5L6R3R3ZOnfqZC9ERhoqCNQpFNLUPSEKnY36LI9OyLpI0VHWyWf
	O5d/ChWWYIYOGmBGjetOp8S+XzUbv5JNn1kZ9b02CuGWU1c+cGXDM35TBx/xFYmYzb7m
	N36cKULtuC1qZMga5Gg9KEnZ8ZF1wAUCwKSjaxKdue9Zt37oAjzAnpvXke9uL6UHHZ07
	Fq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=tPoceqQDfXIUJEIF9jH+KeFIousiGvS9HlzWkIZ11h8=;
	b=kkpNJfqXQIUWBcT5ueczJuzrynexERpek7Hr50WAcPqZYvdjBYq5580svaXeEvUjJx
	PAJiNbBsg7qCKy64Clp76l5lJYYFE6SZTNwVz4ClO/5lvx61HycBVz1W+jShZleuR96M
	LXwAJXzqhTE7cFqhp+D560zD3e2QkCqjSaOemn81oy9aCqXc7I1NY029ru/O0X3hQpa6
	zsTxKYt/DH4WJl3gbUekqNUFKAX0N5XrM9AzHPhJ+lLQa8rIKXw1Phw0mVBHKFj1rCM5
	u9lgj/CBWHbCi2FHB9BIRbYBxFTJrwMK5dFTE2I5e49HJz9GIN+jF8YNvQTuzMkDeviW
	M3eA==
X-Gm-Message-State: AMCzsaWgH8/9NXA7cvQ1zy5Rn2XlzU4MBWEEJQxHrsxJfQzx1tk6uCu1
	ZSl9a10w/IErSImWGELxPzbASIHg
X-Google-Smtp-Source: ABhQp+Qa6HL8nY1OfK1ybG3RGHYEl+R7MqQNsuMv9XTp61pqnE1a1vmFfxSipYuES+cSqE5XDxeoCw==
X-Received: by 10.55.197.20 with SMTP id p20mr3092501qki.229.1509595902211;
	Wed, 01 Nov 2017 21:11:42 -0700 (PDT)
Received: from [192.168.1.240] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	k11sm1534295qtb.95.2017.11.01.21.11.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Nov 2017 21:11:40 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
	Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-89-f4bug@amsat.org>
	<87po9wstr2.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d1a1dcb1-ca42-e03a-cefc-fd8fa4dd5fff@amsat.org>
Date: Thu, 2 Nov 2017 01:11:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <87po9wstr2.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 88/88]
 scripts/coverity-model: use g_new() family of functions
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
X-List-Received-Date: Thu, 02 Nov 2017 04:11:48 -0000

Hi Markus,

On 10/09/2017 03:46 AM, Markus Armbruster wrote:
> Please cc me on changes to stuff I maintain, as scripts/get_maintainer
> tells you :)

Oops I might have been a copy/paste error.

> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
> 
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  scripts/coverity-model.c | 2 +-
[...]
>>  GIOChannel *g_io_channel_unix_new(int fd)
>>  {
>> -    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
>> +    GIOChannel *c = g_new0(GIOChannel, 1);
>>      __coverity_escape__(fd);
>>      return c;
>>  }
> 
> Hmm.
> 
> The Coverity model carefully explains g_malloc0().  It doesn't explain
> g_new0().  With any luck, Coverity can see through g_new0() --- it's a
> macro in my <gmem.h>.  But why complicate matters?  The normal reason
> for changing g_malloc0() to g_new0() doesn't apply here.  Let's leave
> the model alone.

Yes you are right.

