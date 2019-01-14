Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj0LE-0004PX-14
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 06:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj0L9-0004Lv-5s
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:23:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gj0L8-0007dX-7L
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:23:35 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gj0L8-0007cE-1D
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 06:23:34 -0500
Received: by mail-wm1-f68.google.com with SMTP id y185so7099609wmd.1
	for <qemu-trivial@nongnu.org>; Mon, 14 Jan 2019 03:23:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=11eR17M7AQvJx7kZ5S5IOsJvnwc7i/2yFFotFkaB6F4=;
	b=ZDIxc/Mna+Hh6et7NibsLMPoSDqnwdt1LmUImz1ItrcD8wX53l096SZA2lavqsQr7c
	mHMk+52KDqa6K/EmMHrJSa60HuiBhJyPZp+gJi5QGbgpt23Qh0NW2iErNhuCkUPo7sPd
	A0pnWmbH7lFAOtzz5bIE5aJbKvlhIuguHm15n8Lnq2lkK2AOBFb2tfih6VxMupmlw7sP
	gGGTDLSjNuyy9YHyu1SYHK0xeWVo/9wEU/WWvGV6GEjufeYzT5lxVH/6LwcuFnL73lB0
	DPZ3QDI4Uydp5AZo5sNRgMtTGWY2yRVRNbsDXVBxi7KJHoPiBwvbTouA/LYcBcbnB+4p
	SkuA==
X-Gm-Message-State: AJcUukfabOLlfRfSev+xM0KGgsdyww+xa5UnTsMMO/HnHLGu6qokF+X3
	tjUX14Vg344M8mQOzJLaI8IxVg==
X-Google-Smtp-Source: ALg8bN6h4yKkkZtj+22wpQRYJ/A9LW92DuDVVzZFFfFgYZDtr8WCIXG74DfNrrkjBQLgzrE4nf1ItA==
X-Received: by 2002:a1c:c44c:: with SMTP id u73mr11925046wmf.45.1547465012934; 
	Mon, 14 Jan 2019 03:23:32 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	m21sm24097571wmi.43.2019.01.14.03.23.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 03:23:32 -0800 (PST)
To: Max Reitz <mreitz@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
	qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, "Richard W.M. Jones" <rjones@redhat.com>,
	Liu Yuan <namei.unix@gmail.com>
References: <20181213162727.17438-1-lvivier@redhat.com>
	<20181213162727.17438-2-lvivier@redhat.com>
	<7aef3078-085d-b020-e89d-ae30082381b4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <17f7469d-1ee0-b2e0-9866-c634f1d41832@redhat.com>
Date: Mon, 14 Jan 2019 12:23:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <7aef3078-085d-b020-e89d-ae30082381b4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/4] block/ssh: Convert
 from DPRINTF() macro to trace events
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
X-List-Received-Date: Mon, 14 Jan 2019 11:23:39 -0000

On 1/14/19 12:15 PM, Max Reitz wrote:
> On 13.12.18 17:27, Laurent Vivier wrote:
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Reviewed-by: Richard W.M. Jones <rjones@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>
>> Notes:
>>     v2: use %zu with size_t
>>         change an uint64_t to int64_t to match % PRIi64
>>
>>  block/ssh.c        | 46 +++++++++++++++++-----------------------------
>>  block/trace-events | 17 +++++++++++++++++
>>  2 files changed, 34 insertions(+), 29 deletions(-)
>>
>> diff --git a/block/ssh.c b/block/ssh.c
>> index 7fbc27abdf..bbc513e095 100644
>> --- a/block/ssh.c
>> +++ b/block/ssh.c
> 
> [...]
> 
>> @@ -1038,9 +1026,9 @@ static coroutine_fn int ssh_read(BDRVSSHState *s, BlockDriverState *bs,
>>       */
>>      for (got = 0; got < size; ) {
>>      again:
>> -        DPRINTF("sftp_read buf=%p size=%zu", buf, end_of_vec - buf);
>> +        trace_ssh_read_buf(buf, end_of_vec - buf);
>>          r = libssh2_sftp_read(s->sftp_handle, buf, end_of_vec - buf);
>> -        DPRINTF("sftp_read returned %zd", r);
>> +        trace_ssh_read_return(r);
> 
> (Here...
> 
>>  
>>          if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
>>              co_yield(s, bs);
> 
> [...]
> 
>> @@ -1108,9 +1096,9 @@ static int ssh_write(BDRVSSHState *s, BlockDriverState *bs,
>>  
>>      for (written = 0; written < size; ) {
>>      again:
>> -        DPRINTF("sftp_write buf=%p size=%zu", buf, end_of_vec - buf);
>> +        trace_ssh_write_buf(buf, end_of_vec - buf);
>>          r = libssh2_sftp_write(s->sftp_handle, buf, end_of_vec - buf);
>> -        DPRINTF("sftp_write returned %zd", r);
>> +        trace_ssh_write_return(r);
> 
> ...and here r is of type ssize_t)
> 
>>  
>>          if (r == LIBSSH2_ERROR_EAGAIN || r == LIBSSH2_ERROR_TIMEOUT) {
>>              co_yield(s, bs);
> 
> [...]
> 
>> diff --git a/block/trace-events b/block/trace-events
>> index 3e8c47bb24..e1dfd9713a 100644
>> --- a/block/trace-events
>> +++ b/block/trace-events
>> @@ -156,3 +156,20 @@ nvme_cmd_map_qiov_iov(void *s, int i, void *page, int pages) "s %p iov[%d] %p pa
>>  
>>  # block/iscsi.c
>>  iscsi_xcopy(void *src_lun, uint64_t src_off, void *dst_lun, uint64_t dst_off, uint64_t bytes, int ret) "src_lun %p offset %"PRIu64" dst_lun %p offset %"PRIu64" bytes %"PRIu64" ret %d"
>> +
>> +# block/ssh.c
>> +ssh_restart_coroutine(void *co) "co=%p"
>> +ssh_flush(void) "fsync"
>> +ssh_check_host_key_knownhosts(const char *key) "host key OK: %s"
>> +ssh_connect_to_ssh(char *path, int flags, int mode) "opening file %s flags=0x%x creat_mode=0%o"
>> +ssh_co_yield(int sock, void *rd_handler, void *wr_handler) "s->sock=%d rd_handler=%p wr_handler=%p"
>> +ssh_co_yield_back(int sock) "s->sock=%d - back"
>> +ssh_getlength(int64_t length) "length=%" PRIi64
>> +ssh_co_create_opts(uint64_t size) "total_size=%" PRIu64
>> +ssh_read(int64_t offset, size_t size) "offset=%" PRIi64 " size=%zu"
>> +ssh_read_buf(void *buf, size_t size) "sftp_read buf=%p size=%zu"
>> +ssh_read_return(size_t ret) "sftp_read returned %zu"
> 
> Shouldn't this be ssize_t and %zi/%zd?

Oops good catch.

The codebase uses %zd:

$ git grep '%zi'|wc -l
0
$ git grep '%zd'|wc -l
90

Can you directly fix this when applying?

Thanks,

Phil.

> 
>> +ssh_write(int64_t offset, size_t size) "offset=%" PRIi64 " size=%zu"
>> +ssh_write_buf(void *buf, size_t size) "sftp_write buf=%p size=%zu"
>> +ssh_write_return(size_t ret) "sftp_write returned %zu"
> 
> Same here.
> 
> Max
> 
>> +ssh_seek(int64_t offset) "seeking to offset=%" PRIi6
> 

