Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1r39b5-0001OH-Ry
	for mharc-qemu-trivial@gnu.org; Wed, 15 Nov 2023 01:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r39b4-0001Nt-BZ; Wed, 15 Nov 2023 01:41:58 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1r39b1-0006fe-Qg; Wed, 15 Nov 2023 01:41:57 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 5DAAF33552;
 Wed, 15 Nov 2023 09:42:05 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3FD3635315;
 Wed, 15 Nov 2023 09:41:45 +0300 (MSK)
Message-ID: <7259b384-cc7f-4400-9891-83e656765ce2@tls.msk.ru>
Date: Wed, 15 Nov 2023 09:41:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH trivial 06/21] docs/devel/migration.rst: spelling fix:
 doen't
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>
References: <20231114165834.2949011-1-mjt@tls.msk.ru>
 <20231114165834.2949011-7-mjt@tls.msk.ru>
 <f2bfef4a-3a2c-4d32-adf6-52317f85a045@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <f2bfef4a-3a2c-4d32-adf6-52317f85a045@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Nov 2023 06:41:58 -0000

14.11.2023 22:05, Thomas Huth wrote:
> On 14/11/2023 17.58, Michael Tokarev wrote:
>> Fixes: 1aefe2ca1423 "migration/doc: Add documentation for backwards compatiblity"
>> Cc: Juan Quintela <quintela@redhat.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>   docs/devel/migration.rst | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
>> index 5adf4f12f7..51b1f61f5e 100644
>> --- a/docs/devel/migration.rst
>> +++ b/docs/devel/migration.rst
>> @@ -1061,7 +1061,7 @@ QEMU version, in this case pc-5.1.
>>   4 - qemu-5.1 -M pc-5.2  -> migrates to -> qemu-5.1 -M pc-5.2
>> -  This combination is not possible as the qemu-5.1 doen't understand
>> +  This combination is not possible as the qemu-5.1 does't understand
> 
> You replaced one typo with another one :-)

Heh. Lovely! :)

The "really-really-fixed" one (without resending):

-  This combination is not possible as the qemu-5.1 doen't understand
+  This combination is not possible as the qemu-5.1 doesn't understand
    pc-5.2 machine type.  So nothing to worry here.

;)

Thank you for the review and for spotting it!

/mjt


