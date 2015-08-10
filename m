Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZOrqG-0006ma-Gg
	for mharc-qemu-trivial@gnu.org; Mon, 10 Aug 2015 14:30:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZOrqD-0006kU-38
	for qemu-trivial@nongnu.org; Mon, 10 Aug 2015 14:30:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZOrq6-0006RR-3T
	for qemu-trivial@nongnu.org; Mon, 10 Aug 2015 14:30:32 -0400
Received: from mail-wi0-f170.google.com ([209.85.212.170]:34759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZOrq5-0006QN-Rg
	for qemu-trivial@nongnu.org; Mon, 10 Aug 2015 14:30:26 -0400
Received: by wicne3 with SMTP id ne3so146922912wic.1
	for <qemu-trivial@nongnu.org>; Mon, 10 Aug 2015 11:30:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=fAAhaCpBNgT5HGHLyw0Xww357+VwzFKUPbafx2MqRWA=;
	b=YSxtJ3MwmjS31OFdJXXu3P4gLiHcEtLCwwccu/Vx31RfCCewTUtLO6EnOXRrSshymc
	fQfNu0wnUVCpKrB7i16MgFK6gqad2wZauyrk6IZrucwK+w0yJ9Wb+nvMU2tz7TjL65bS
	NMAdHtAgQl8ERjwCAQJzH7LKztgc0KGQZHVKt369t9v4ueUwnXZx8SqzOySlSvSYLUhu
	hqM3B5OJ76TJkit61y/qC/HNGa2iddSGi3QQib9h3RQuDgJ6p45bo0SRx9MnJPylBLdl
	q2guJOLHPVaWpWezMPY4kKYocbQDSMbNlRpnNCjm+l7kJamZ4Pr+7mQmS/B3ynU/yk2+
	RBzw==
X-Gm-Message-State: ALoCoQn+QdGKOGzX1isk7cFRKWXUlYK2XWfEta/tmVoOY22Ydbh9nSoKsQBmlvNkA0LNCjW6cbR4
X-Received: by 10.180.149.146 with SMTP id ua18mr26441691wib.86.1439231425122; 
	Mon, 10 Aug 2015 11:30:25 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	cw8sm30645603wjb.49.2015.08.10.11.30.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2015 11:30:24 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id EE0863E05BC;
	Mon, 10 Aug 2015 19:30:22 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-8-git-send-email-alex.bennee@linaro.org>
	<55C8D855.9060205@codeaurora.org>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christopher Covington <cov@codeaurora.org>
In-reply-to: <55C8D855.9060205@codeaurora.org>
Date: Mon, 10 Aug 2015 19:30:22 +0100
Message-ID: <87d1yvgfnl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.170
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, crosthwaitepeter@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 07/11] qemu-log: new
	option -dfilter to limit output
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
X-List-Received-Date: Mon, 10 Aug 2015 18:30:34 -0000


Christopher Covington <cov@codeaurora.org> writes:

> Hi Alex,
>
> On 08/03/2015 05:14 AM, Alex Bennée wrote:
>> When debugging big programs or system emulation sometimes you want both
>> the verbosity of cpu,exec et all but don't want to generate lots of logs
>> for unneeded stuff. This patch adds a new option -dfilter which allows
>> you to specify interesting address ranges in the form:
>> 
>>   -dfilter 0x8000-0x9000,0xffffffc000080000+0x200,...
>> 
>> Then logging code can use the new qemu_log_in_addr_range() function to
>> decide if it will output logging information for the given range.
>> 
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> My usual flow is to filter based on mode (CurrentEL on AArch64) and PID
> (CONTEXTIDR on AArch64). Do you foresee any problems with adding such
> filters?

I have indeed added such filters on for my own debugging efforts.
However the problem is they are very target focused and I don't want to
pollute the generic code with target specific hacks. I suspect we need
two things:

  - a way to add target specific options to the UI
  - a target agnostic hook which allows additional refinement of the filter

>
> Thanks,
> Christopher Covington
>
>> v2
>>   - More clean-ups to the documentation
>> 
>> v3
>>   - re-base
>>   - use GArray instead of GList to avoid cache bouncing
>>   - checkpatch fixes
>> ---
>>  include/qemu/log.h |  2 ++
>>  qemu-log.c         | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  qemu-options.hx    | 16 +++++++++++++++
>>  vl.c               |  3 +++
>>  4 files changed, 78 insertions(+)
>> 
>> diff --git a/include/qemu/log.h b/include/qemu/log.h
>> index b80f8f5..ade1f76 100644
>> --- a/include/qemu/log.h
>> +++ b/include/qemu/log.h
>> @@ -182,6 +182,8 @@ static inline void qemu_set_log(int log_flags)
>>  }
>>  
>>  void qemu_set_log_filename(const char *filename);
>> +void qemu_set_dfilter_ranges(const char *ranges);
>> +bool qemu_log_in_addr_range(uint64_t addr);
>>  int qemu_str_to_log_mask(const char *str);
>>  
>>  /* Print a usage message listing all the valid logging categories
>> diff --git a/qemu-log.c b/qemu-log.c
>> index 77ed7bc..b3ebd3c 100644
>> --- a/qemu-log.c
>> +++ b/qemu-log.c
>> @@ -19,11 +19,13 @@
>>  
>>  #include "qemu-common.h"
>>  #include "qemu/log.h"
>> +#include "qemu/range.h"
>>  
>>  static char *logfilename;
>>  FILE *qemu_logfile;
>>  int qemu_loglevel;
>>  static int log_append = 0;
>> +static GArray *debug_regions;
>>  
>>  void qemu_log(const char *fmt, ...)
>>  {
>> @@ -92,6 +94,61 @@ void qemu_set_log_filename(const char *filename)
>>      qemu_set_log(qemu_loglevel);
>>  }
>>  
>> +/* Returns true if addr is in our debug filter or no filter defined
>> + */
>> +bool qemu_log_in_addr_range(uint64_t addr)
>> +{
>> +    if (debug_regions) {
>> +        int i = 0;
>> +        for (i = 0; i < debug_regions->len; i++) {
>> +            struct Range *range = &g_array_index(debug_regions, Range, i);
>> +            if (addr >= range->begin && addr <= range->end) {
>> +                return true;
>> +            }
>> +        }
>> +        return false;
>> +    } else {
>> +        return true;
>> +    }
>> +}
>> +
>> +
>> +void qemu_set_dfilter_ranges(const char *filter_spec)
>> +{
>> +    gchar **ranges = g_strsplit(filter_spec, ",", 0);
>> +    if (ranges) {
>> +        gchar **next = ranges;
>> +        gchar *r = *next++;
>> +        debug_regions = g_array_sized_new(FALSE, FALSE,
>> +                                          sizeof(Range), g_strv_length(ranges));
>> +        while (r) {
>> +            gchar *delim = g_strrstr(r, "-");
>> +            if (!delim) {
>> +                delim = g_strrstr(r, "+");
>> +            }
>> +            if (delim) {
>> +                struct Range range;
>> +                range.begin = strtoul(r, NULL, 0);
>> +                switch (*delim) {
>> +                case '+':
>> +                    range.end = range.begin + strtoul(delim+1, NULL, 0);
>> +                    break;
>> +                case '-':
>> +                    range.end = strtoul(delim+1, NULL, 0);
>> +                    break;
>> +                default:
>> +                    g_assert_not_reached();
>> +                }
>> +                g_array_append_val(debug_regions, range);
>> +            } else {
>> +                g_error("Bad range specifier in: %s", r);
>> +            }
>> +            r = *next++;
>> +        }
>> +        g_strfreev(ranges);
>> +    }
>> +}
>> +
>>  const QEMULogItem qemu_log_items[] = {
>>      { CPU_LOG_TB_OUT_ASM, "out_asm",
>>        "show generated host assembly code for each compiled TB" },
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index ae53346..90f0df9 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -2987,6 +2987,22 @@ STEXI
>>  Output log in @var{logfile} instead of to stderr
>>  ETEXI
>>  
>> +DEF("dfilter", HAS_ARG, QEMU_OPTION_DFILTER, \
>> +    "-dfilter range,..  filter debug output to range of addresses (useful for -d cpu,exec,etc..)\n",
>> +    QEMU_ARCH_ALL)
>> +STEXI
>> +@item -dfilter @var{range1}[,...]
>> +@findex -dfilter
>> +Filter debug output to that relevant to a range of target addresses. The filter
>> +spec can be either @var{start}-@var{end} or @var{start}+@var{size} where @var{start}
>> +@var{end} and @var{size} are the addresses and sizes required. For example:
>> +@example
>> +    -dfilter 0x8000-0x9000,0xffffffc000080000+0x200
>> +@end example
>> +Will dump output for any code in the 0x1000 sized block starting at 0x8000 and
>> +the 0x200 sized block starting at 0xffffffc000080000.
>> +ETEXI
>> +
>>  DEF("L", HAS_ARG, QEMU_OPTION_L, \
>>      "-L path         set the directory for the BIOS, VGA BIOS and keymaps\n",
>>      QEMU_ARCH_ALL)
>> diff --git a/vl.c b/vl.c
>> index 1d2de4f..05211cf 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -3349,6 +3349,9 @@ int main(int argc, char **argv, char **envp)
>>              case QEMU_OPTION_D:
>>                  log_file = optarg;
>>                  break;
>> +            case QEMU_OPTION_DFILTER:
>> +                qemu_set_dfilter_ranges(optarg);
>> +                break;
>>              case QEMU_OPTION_PERFMAP:
>>                  tb_enable_perfmap();
>>                  break;
>> 

-- 
Alex Bennée

