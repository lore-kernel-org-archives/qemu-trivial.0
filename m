Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJLxW-0007g9-PZ
	for mharc-qemu-trivial@gnu.org; Mon, 08 Mar 2021 14:54:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLxS-0007fc-SV
 for qemu-trivial@nongnu.org; Mon, 08 Mar 2021 14:54:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJLxQ-0000Pi-CH
 for qemu-trivial@nongnu.org; Mon, 08 Mar 2021 14:54:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615233261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ASTDmUrSarcUjSRqZocuSlpOrdMvKtSIRX5bZsoXwK4=;
 b=ZsscCxuMIdKuUhnl9KKZMzKYyoOQZ4vrA6IFb2LThYFtfwK3Tj3R/lHWQQs929C25SfLS3
 G0fJ9+vfYVolBINK3UJpTErYRQViSpJBnhpjzfeWzjYfRHoNFtaECU3ncoEWTF+HL5qAT2
 s7W88R6QnIqze6oLxJwqq9N3rplZe7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-dHIdYokbP9C-U8_xDfCuqw-1; Mon, 08 Mar 2021 14:54:19 -0500
X-MC-Unique: dHIdYokbP9C-U8_xDfCuqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CC41801814;
 Mon,  8 Mar 2021 19:54:18 +0000 (UTC)
Received: from [10.3.112.36] (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 837965C266;
 Mon,  8 Mar 2021 19:54:17 +0000 (UTC)
Subject: Re: [PATCH] scsi: Silence gcc warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210209152350.207958-1-eblake@redhat.com>
 <2ca3b005-9d9f-dde6-a7d4-b7e08a3e3066@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <01bc8d3d-5399-dfad-0ca3-c9392fcb176c@redhat.com>
Date: Mon, 8 Mar 2021 13:54:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2ca3b005-9d9f-dde6-a7d4-b7e08a3e3066@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 08 Mar 2021 19:54:27 -0000

Adding qemu-trivial in cc.

On 2/9/21 9:44 AM, Philippe Mathieu-Daudé wrote:
> On 2/9/21 4:23 PM, Eric Blake wrote:
>> On Fedora 33, gcc 10.2.1 notes that scsi_cdb_length(buf) can set
>> len==-1, which in turn overflows g_malloc():
>>
>> [5/5] Linking target qemu-system-x86_64
>> In function ‘scsi_disk_new_request_dump’,
>>     inlined from ‘scsi_new_request’ at ../hw/scsi/scsi-disk.c:2608:9:
>> ../hw/scsi/scsi-disk.c:2582:19: warning: argument 1 value ‘18446744073709551612’ exceeds maximum object size 9223372036854775807 [-Walloc-size-larger-than=]
>>  2582 |     line_buffer = g_malloc(len * 5 + 1);
>>       |                   ^
>>
>> Silence it with a decent assertion, since we only convert a buffer to
>> bytes when we have a valid cdb length.
>>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>  hw/scsi/scsi-disk.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>> index ed52fcd49ff0..b3311a5657b7 100644
>> --- a/hw/scsi/scsi-disk.c
>> +++ b/hw/scsi/scsi-disk.c
>> @@ -2579,6 +2579,7 @@ static void scsi_disk_new_request_dump(uint32_t lun, uint32_t tag, uint8_t *buf)
>>      int len = scsi_cdb_length(buf);
>>      char *line_buffer, *p;
>>
>> +    assert(len > 0 && len <= 16);
>>      line_buffer = g_malloc(len * 5 + 1);
>>
>>      for (i = 0, p = line_buffer; i < len; i++) {
>>
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


