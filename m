Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iZHAm-00007q-VZ
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2019 11:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iZHAl-00006K-1E
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 11:25:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iZHAj-0005Wb-Qa
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 11:25:10 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58232
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iZHAj-0005WT-N5
 for qemu-trivial@nongnu.org; Mon, 25 Nov 2019 11:25:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574699108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpWoAuNt4KGKQ+xl08kYRnys7W7k/TC2TB6w3sXsqbw=;
 b=K/Fm9Zj+T2FUaZdfchOpOT7UwFMUqmq/178+RoZS2P7PMHyIt8MIjJ9zapr2PINdDxspbG
 BHzeGE/81YxOslJy+4KmRH29llTbNaxWe1C6F9dE/8l8MxX0+7jN7CUop7vRCf1p3QmkZr
 QWzqF38+CzLJkURbGGT5Ty7/+9HlsJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-wpfFU-ZkN_iqxCvL7Q5oYA-1; Mon, 25 Nov 2019 11:25:06 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F3D81856A8D;
 Mon, 25 Nov 2019 16:25:05 +0000 (UTC)
Received: from [10.3.116.163] (ovpn-116-163.phx2.redhat.com [10.3.116.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 095631001B03;
 Mon, 25 Nov 2019 16:25:03 +0000 (UTC)
Subject: Re: [PATCH 2/2] test-keyval: Tighten test of trailing crap after size
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, tao3.xu@intel.com
References: <20191125133846.27790-1-armbru@redhat.com>
 <20191125133846.27790-3-armbru@redhat.com>
 <b06f7807-b201-5a52-5a62-b50f52cc4d44@redhat.com>
 <87fticdlbx.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <49d5c743-5ff4-2f5a-cb45-a6730d85f5f9@redhat.com>
Date: Mon, 25 Nov 2019 10:25:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87fticdlbx.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: wpfFU-ZkN_iqxCvL7Q5oYA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Nov 2019 16:25:12 -0000

On 11/25/19 9:31 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
> 
>> On 11/25/19 7:38 AM, Markus Armbruster wrote:
>>> test_keyval_visit_size() should test for trailing crap after size with
>>> and without suffix.  It does test the latter: "sz2=16Gi" has size
>>> "16G" followed by crap "i".  It fails to test the former "sz1=16E" is
>>> a syntactically valid size that overflows uint64_t.  Replace by
>>> "sz1=0Z".
>>>

>>>          /* Trailing crap */
>>> -    qdict = keyval_parse("sz1=16E,sz2=16Gi", NULL, &error_abort);
>>> +    qdict = keyval_parse("sz1=0Z,sz2=16Gi", NULL, &error_abort);
>>
>> Does this actually test both failure cases, or does it abort the parse
>> after the first failure (sz1=0Z) without ever hitting the second half
>> of the parse (sz2=16Gi)?
> 
> Fair question!  Short answer: yes, we check both.

Aha - keyval_parse() just sets up the parser, while the check for double 
failures is in the test code below.

> Clear now?

Yes.
Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


