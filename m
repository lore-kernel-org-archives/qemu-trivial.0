Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGShg-0004vX-1D
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 08:30:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YGShd-0004tx-FF
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 08:30:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YGShc-0006cj-BR
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 08:30:41 -0500
Received: from mail-wg0-x22c.google.com ([2a00:1450:400c:c00::22c]:57474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YGShX-0006Yb-Op; Wed, 28 Jan 2015 08:30:36 -0500
Received: by mail-wg0-f44.google.com with SMTP id z12so20619483wgg.3;
	Wed, 28 Jan 2015 05:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=5FB+jHLOWvjkxitLb0sIJKyug1JKgmOl9aDXGZ/gBlU=;
	b=e7w7YCRQSPhdIvUA393B0tot9/Ll4NC2qWw0iddsyD5jf6Xc6jv0Pw47PUZ8dhPu5n
	o8oXKMbpyhH/jETyWP5/qWXBOJ32DNrY+RT4rqPUA1okuOTPlcuZ/XU77M8gREW/22yC
	ljCXsvxWUk8qQKT9ZbJS6gsG5z9eqzLz3shzjTqipdzmCoSpcRfhJMWUqjl4G1Wqk0fs
	KdIiyUk5+ML/LibD8DzyWIR/cD/giib5W7TCqQCz7krUjWsFXLl4plDp+Hjn9EfYZKC4
	pZmiI03V8hlkzZZer8sy2qhezjvJ1e67LkgxmGOpZZioQo3Zd4JkrNQQ2NpzWcSHHRwr
	zSfg==
X-Received: by 10.180.21.162 with SMTP id w2mr7090841wie.42.1422451834317;
	Wed, 28 Jan 2015 05:30:34 -0800 (PST)
Received: from [10.32.176.134] (nat-pool-mxp-t.redhat.com. [209.132.186.18])
	by mx.google.com with ESMTPSA id cx3sm2842124wib.10.2015.01.28.05.30.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 05:30:33 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54C8E477.6030304@redhat.com>
Date: Wed, 28 Jan 2015 14:30:31 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1422375232-29283-1-git-send-email-armbru@redhat.com>	<54C7C02E.40701@redhat.com>
	<87twzb881q.fsf@blackfin.pond.sub.org>
In-Reply-To: <87twzb881q.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22c
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] util/uri: Cleanups and a bug fix
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
X-List-Received-Date: Wed, 28 Jan 2015 13:30:42 -0000



On 28/01/2015 12:21, Markus Armbruster wrote:
>> > Patches 1-2 okay.  For patch 3 a very similar patch was posted yesterday.
> Missed it until now.  Yes, it's functionally identical.
> 
> Dear -trivial maintainer, pick whichever you like better :)

Sure -- Markus's is nicer indeed.

Paolo

