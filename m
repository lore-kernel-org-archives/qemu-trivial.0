Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNfZ4-0002EY-Vd
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 10:25:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfZ2-0002DA-Ko
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 10:25:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfZ1-0000gl-H6
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 10:25:28 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34419)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfYv-0000Ys-Ul; Tue, 29 May 2018 10:25:22 -0400
Received: by mail-qk0-x241.google.com with SMTP id q70-v6so2968745qke.1;
	Tue, 29 May 2018 07:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ghEUv0Rmn6HlVwbB1vedKO7PalJLVihCMndLlD6HMew=;
	b=VGL3KKJeZiKGNApmpShnwC3Q65lbL5k8KvkAVVUARLd8KiB7UsmNe+1nYol6kgl/O8
	Jj7EmGCnCVFYchYK/k6td3mC2+7FU8aUTAC3yboiTd9GIkoQxX0rN4Uhu0sak2O8ZT0F
	21WntH1IoRUMRYFE8ZKXkDRwViCGoEUav6tVfxSjPcN4VuOHV21ymMlARVhejtWpY/Ua
	jVMg/bc0MH8aAz6zce+0sZQtBqvsg9KFmF9Sk7QVtdnVaPdiA0sWZ3N4Yurd8uASvkcd
	6WMNpriZFlCx9EabfkCdLEaBudk57KdZCLacmibN+ejT+sUzh40gDKA1P8h3BS+/QeVE
	WLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ghEUv0Rmn6HlVwbB1vedKO7PalJLVihCMndLlD6HMew=;
	b=TSGoFEn6qqKMl/vjIwnhof2AaIiU8xkcS3rLJJJ5UJ4aplvPN+74Py0juBsc1UvAAB
	JVzd1V3sy3Tw+83CuKWswzv21wmP49GDoB2sfwIdS6s5hOmC/jn/21Kz06qG0MKwqE7X
	n9NlLv8vAm9iKSexY6FrhxWfc3xdyzBmu15FdzN7xJ+CxuLaKKczYGzfglAjoGTtW3BB
	ETpy0FVNwfi13tFypBiqHxkwWjuzrXYXhgMkibOYelM1ReKCsSKo6zbfRRZBz1qLI90H
	PuEPu5GvK0zMxHuc1P8eMPzUVukeVMXU/OzkV5sKaqtOXMWwTJ8ZqLLw5axpH3pzJlYs
	/B4g==
X-Gm-Message-State: ALKqPwcBMy6omQuGN+Vh74x/v3ar5qjbkVXRk/2UWmky8FOvJgxxEYPm
	jVolBYsj4awnFHTPZBnyF8qkQHd5hI4=
X-Google-Smtp-Source: ADUXVKJNrmR+bZpwlQzElUx0AA2vf7DaJ10tcOzgBNBV1nfLEf5B2aT3VfVMlNsY37qXpJ6tjIYwRw==
X-Received: by 2002:a37:4d56:: with SMTP id
	a83-v6mr15476428qkb.105.1527603921240; 
	Tue, 29 May 2018 07:25:21 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	47-v6sm26507950qtw.4.2018.05.29.07.25.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 07:25:20 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-27-f4bug@amsat.org>
	<cc23ddee-ad10-74ef-874c-6ed1ef485d2e@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <811e6e16-d9d7-3b96-7d43-f9d7b6ace063@amsat.org>
Date: Tue, 29 May 2018 11:25:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <cc23ddee-ad10-74ef-874c-6ed1ef485d2e@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 26/35] linux-user:
 use is_error() to avoid warnings and make the code clearer
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
X-List-Received-Date: Tue, 29 May 2018 14:25:29 -0000

Hi Laurent,

On 07/24/2017 04:16 PM, Laurent Vivier wrote:
> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>> linux-user/flatload.c:740:9: warning: Loss of sign in implicit conversion
>>     if (res > (unsigned long)-4096)
>>         ^~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> 
>> ---
>>  linux-user/flatload.c | 15 +++++++++------
>>  1 file changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/linux-user/flatload.c b/linux-user/flatload.c
>> index a35a560904..10c529910f 100644
>> --- a/linux-user/flatload.c
>> +++ b/linux-user/flatload.c
>> @@ -224,8 +224,9 @@ static int decompress_exec(
>>  		ret = bprm->file->f_op->read(bprm->file, buf, LBUFSIZE, &fpos);
>>  		if (ret <= 0)
>>  			break;
>> -		if (ret >= (unsigned long) -4096)
>> +                if (is_error(ret)) {
>>  			break;
>> +                }
>>  		len -= ret;
>>  
>>  		strm.next_in = buf;
>> @@ -283,8 +284,7 @@ calc_reloc(abi_ulong r, struct lib_info *p, int curid, int internalp)
>>                      "in same module (%d != %d)\n",
>>                      (unsigned) r, curid, id);
>>              goto failed;
>> -        } else if ( ! p[id].loaded &&
>> -                    load_flat_shared_library(id, p) > (unsigned long) -4096) {
>> +        } else if (!p[id].loaded && is_error(load_flat_shared_library(id, p))) {
>>              fprintf(stderr, "BINFMT_FLAT: failed to load library %d\n", id);
>>              goto failed;
>>          }
>> @@ -523,9 +523,10 @@ static int load_flat_file(struct linux_binprm * bprm,
>>                  fpos = 0;
>>                  result = bprm->file->f_op->read(bprm->file,
>>                                  (char *) textpos, text_len, &fpos);
>> -                if (result < (unsigned long) -4096)
>> +                if (!is_error(result)) {
>>                          result = decompress_exec(bprm, text_len, (char *) datapos,
>>                                           data_len + (relocs * sizeof(unsigned long)), 0);
>> +                }
>>          }
>>          else
>>  #endif
>> @@ -693,8 +694,9 @@ static int load_flat_shared_library(int id, struct lib_info *libs)
>>  
>>  	res = prepare_binprm(&bprm);
>>  
>> -	if (res <= (unsigned long)-4096)
>> +        if (!is_error(res)) {
>>  		res = load_flat_file(&bprm, libs, id, NULL);
>> +        }
>>  	if (bprm.file) {
>>  		allow_write_access(bprm.file);
>>  		fput(bprm.file);
>> @@ -737,8 +739,9 @@ int load_flt_binary(struct linux_binprm *bprm, struct image_info *info)
>>  
>>  
>>      res = load_flat_file(bprm, libinfo, 0, &stack_len);
>> -    if (res > (unsigned long)-4096)
>> +    if (is_error(res)) {
>>              return res;
>> +    }
>>  
>>      /* Update data segment pointers for all libraries */
>>      for (i=0; i<MAX_SHARED_LIBS; i++) {
>>

Can you take this via your linux-user tree?

Thanks,

Phil.

