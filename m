Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzGY4-0007hc-ID
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 22:33:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WzGXt-0007Vs-QZ
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 22:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1WzGXk-00042h-Ov
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 22:33:17 -0400
Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236]:57092)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1WzGXS-00040v-0R; Mon, 23 Jun 2014 22:32:50 -0400
Received: by mail-pb0-f54.google.com with SMTP id un15so6589500pbc.41
	for <multiple recipients>; Mon, 23 Jun 2014 19:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=Z5X5K579gwBaYuup356372SEucLEqNv7h3hPJ1z5AAo=;
	b=JtuOWW2xgLiYU6E75o3+pesaqtZAhB3tRUvmWVpVwuujEiOWH3hHbl9krOCdxpnwaa
	r6xO6nYn7tBW7iKwm6zIKtzJBuuc0dS4Jr+BkPfAurc+u/aCwoLI6zqUlnanLCIRo7G8
	QGN8rSITAIuMvgFVf/ibBPX00wvIBpiP8edcnnEp7qF/pyLYQv0aKdzonmoRhHnUvzgx
	l4kPOuKFmawOHYvdsBYVjyG1tvPyQ6YI3ukBcW+RUvJ80MoRXPWD12wrrjxG8IGbYHE4
	Yzbjmnbmz81/9/0K4euGjMNvMWqDg0tllnF79PiNRLGFU25ma2bZs3LH5h9lWICKMDyR
	a9Lw==
X-Received: by 10.68.143.231 with SMTP id sh7mr33975164pbb.7.1403577168494;
	Mon, 23 Jun 2014 19:32:48 -0700 (PDT)
Received: from [192.168.1.23] ([124.127.118.42])
	by mx.google.com with ESMTPSA id
	fo2sm10192288pbb.53.2014.06.23.19.32.45 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Jun 2014 19:32:48 -0700 (PDT)
Message-ID: <53A8E34B.40607@gmail.com>
Date: Tue, 24 Jun 2014 10:32:43 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>
References: <53A84797.9040304@gmail.com>
	<20140624022547.GC26197@T430.redhat.com>
In-Reply-To: <20140624022547.GC26197@T430.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::236
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	mreitz@redhat.com, stefanha@redhat.com, eblake@redhat.com
Subject: Re: [Qemu-trivial] [PATCH trivial v2] block.c: Add return value for
 bdrv_append_temp_snapshot() to avoid incorrect failure processing issue
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
X-List-Received-Date: Tue, 24 Jun 2014 02:33:27 -0000


On 06/24/2014 10:25 AM, Fam Zheng wrote:
> On Mon, 06/23 23:28, Chen Gang wrote:
>> When failure occurs, 'ret' need be set, or may return 0 to indicate success.
> 
> s/need/needs/
> 
>> And error_propagate() also need be called only one time within a function.
> 
> s/need/needs/
> 

For a grammar in my learning, in this situation, 'need' is not a verb,
"be set" and "be called" are the verb used with passive mode.

>>
>> It is abnormal to prevent bdrv_append_temp_snapshot() return value but still
>> set errp when error occurs -- although it contents return value internally.
> 
> s/contents/has/
> 

OK, thanks, and excuse me for my poor English. If necessary I shall send
patch v2 for it.

>>
>> So let bdrv_append_temp_snapshot() internal return value outside, and let
>> all things normal, then fix the issue too.
>>
>>
>> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
>> ---
>>  block.c               | 7 ++++---
>>  include/block/block.h | 2 +-
>>  2 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/block.c b/block.c
>> index 74af8d7..5e4fb60 100644
>> --- a/block.c
>> +++ b/block.c
>> @@ -1240,7 +1240,7 @@ done:
>>      return ret;
>>  }
>>  
>> -void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
>> +int bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
>>  {
>>      /* TODO: extra byte is a hack to ensure MAX_PATH space on Windows. */
>>      char *tmp_filename = g_malloc0(PATH_MAX + 1);
>> @@ -1258,6 +1258,7 @@ void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
>>      /* Get the required size from the image */
>>      total_size = bdrv_getlength(bs);
>>      if (total_size < 0) {
>> +        ret = total_size;
>>          error_setg_errno(errp, -total_size, "Could not get image size");
>>          goto out;
>>      }
>> @@ -1304,6 +1305,7 @@ void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp)
>>  
>>  out:
>>      g_free(tmp_filename);
>> +    return ret;
>>  }
>>  
>>  static QDict *parse_json_filename(const char *filename, Error **errp)
>> @@ -1495,9 +1497,8 @@ int bdrv_open(BlockDriverState **pbs, const char *filename,
>>      /* For snapshot=on, create a temporary qcow2 overlay. bs points to the
>>       * temporary snapshot afterwards. */
>>      if (snapshot_flags) {
>> -        bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
>> +        ret = bdrv_append_temp_snapshot(bs, snapshot_flags, &local_err);
>>          if (local_err) {
>> -            error_propagate(errp, local_err);
>>              goto close_and_fail;
>>          }
>>      }
>> diff --git a/include/block/block.h b/include/block/block.h
>> index f15b99b..7b3381c 100644
>> --- a/include/block/block.h
>> +++ b/include/block/block.h
>> @@ -217,7 +217,7 @@ int bdrv_open_image(BlockDriverState **pbs, const char *filename,
>>                      bool allow_none, Error **errp);
>>  void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd);
>>  int bdrv_open_backing_file(BlockDriverState *bs, QDict *options, Error **errp);
>> -void bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp);
>> +int bdrv_append_temp_snapshot(BlockDriverState *bs, int flags, Error **errp);
> 
> Not used outside block.c, but pre-existing.
> 

Yeah, originally, I considered about it, and finally still remained it
as pre-existing.

> Reviewed-by: Fam Zheng <famz@redhat.com>
> 
Thank you for your work.

Thanks.
-- 
Chen Gang

Open, share, and attitude like air, water, and life which God blessed

