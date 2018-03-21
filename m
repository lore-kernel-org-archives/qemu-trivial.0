Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eydbu-0004dX-NQ
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 09:17:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1eydbq-0004Zj-Cc
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1eydbm-0008O2-9F
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:16:54 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <danielhb@linux.vnet.ibm.com>)
	id 1eydbl-0008Ms-TQ
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:16:50 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w2LDGNd4114750
	for <qemu-trivial@nongnu.org>; Wed, 21 Mar 2018 09:16:47 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2gun827hug-1
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Wed, 21 Mar 2018 09:16:46 -0400
Received: from localhost
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <danielhb@linux.vnet.ibm.com>;
	Wed, 21 Mar 2018 07:16:45 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
	by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 21 Mar 2018 07:16:44 -0600
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w2LDGh8113828572; Wed, 21 Mar 2018 06:16:43 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 838B678051;
	Wed, 21 Mar 2018 07:16:43 -0600 (MDT)
Received: from [9.85.189.206] (unknown [9.85.189.206])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 5CC5F78041; 
	Wed, 21 Mar 2018 07:16:41 -0600 (MDT)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
References: <20180321120853.14293-1-lvivier@redhat.com>
From: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
Date: Wed, 21 Mar 2018 10:16:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321120853.14293-1-lvivier@redhat.com>
Content-Type: multipart/alternative;
	boundary="------------39F47AB03172B8768229509C"
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032113-0024-0000-0000-0000181BD68C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008715; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000254; SDB=6.01006281; UDB=6.00512363;
	IPR=6.00785564; 
	MB=3.00020163; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-21 13:16:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032113-0025-0000-0000-00004F3096CD
Message-Id: <5193a40a-33fb-5b55-5fea-608a5573980e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=11 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1803210159
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dump: display cause of
 write failure
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
X-List-Received-Date: Wed, 21 Mar 2018 13:16:57 -0000

This is a multi-part message in MIME format.
--------------39F47AB03172B8768229509C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Laurent,

There is already a v3 version of Yasmin's patch that was approved and
it is supposedly waiting to be merged:

http://lists.gnu.org/archive/html/qemu-devel/2018-02/msg03035.html


In a quick look at this patch looks like they do the same thing.


Daniel

On 03/21/2018 09:08 AM, Laurent Vivier wrote:
> Use error_setg_errno() to display the reason why data write
> has failed. For instance, instead of a laconic
>
>    dump: failed to write elf header
> or
>    dump: failed to save memory
>
> we have now:
>
>    dump: failed to write elf header: No space left on device
> or
>    dump: failed to save memory: No space left on device
>
> CC: Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
> CC: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>   dump.c | 79 +++++++++++++++++++++++++++++++++++++++---------------------------
>   1 file changed, 47 insertions(+), 32 deletions(-)
>
> diff --git a/dump.c b/dump.c
> index 6bdb0dbe23..d04e3f56b0 100644
> --- a/dump.c
> +++ b/dump.c
> @@ -140,7 +140,7 @@ static void write_elf64_header(DumpState *s, Error **errp)
>
>       ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write elf header");
> +        error_setg_errno(errp, errno, "dump: failed to write elf header");
>       }
>   }
>
> @@ -171,7 +171,7 @@ static void write_elf32_header(DumpState *s, Error **errp)
>
>       ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write elf header");
> +        error_setg_errno(errp, errno, "dump: failed to write elf header");
>       }
>   }
>
> @@ -194,7 +194,8 @@ static void write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,
>
>       ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write program header table");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to write program header table");
>       }
>   }
>
> @@ -217,7 +218,8 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
>
>       ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write program header table");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to write program header table");
>       }
>   }
>
> @@ -237,7 +239,8 @@ static void write_elf64_note(DumpState *s, Error **errp)
>
>       ret = fd_write_vmcore(&phdr, sizeof(Elf64_Phdr), s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write program header table");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to write program header table");
>       }
>   }
>
> @@ -254,7 +257,7 @@ static void write_guest_note(WriteCoreDumpFunction f, DumpState *s,
>       if (s->guest_note) {
>           ret = f(s->guest_note, s->guest_note_size, s);
>           if (ret < 0) {
> -            error_setg(errp, "dump: failed to write guest note");
> +            error_setg_errno(errp, errno, "dump: failed to write guest note");
>           }
>       }
>   }
> @@ -270,7 +273,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
>           id = cpu_index(cpu);
>           ret = cpu_write_elf64_note(f, cpu, id, s);
>           if (ret < 0) {
> -            error_setg(errp, "dump: failed to write elf notes");
> +            error_setg_errno(errp, errno, "dump: failed to write elf notes");
>               return;
>           }
>       }
> @@ -278,7 +281,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
>       CPU_FOREACH(cpu) {
>           ret = cpu_write_elf64_qemunote(f, cpu, s);
>           if (ret < 0) {
> -            error_setg(errp, "dump: failed to write CPU status");
> +            error_setg_errno(errp, errno, "dump: failed to write CPU status");
>               return;
>           }
>       }
> @@ -302,7 +305,8 @@ static void write_elf32_note(DumpState *s, Error **errp)
>
>       ret = fd_write_vmcore(&phdr, sizeof(Elf32_Phdr), s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write program header table");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to write program header table");
>       }
>   }
>
> @@ -317,7 +321,7 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
>           id = cpu_index(cpu);
>           ret = cpu_write_elf32_note(f, cpu, id, s);
>           if (ret < 0) {
> -            error_setg(errp, "dump: failed to write elf notes");
> +            error_setg_errno(errp, errno, "dump: failed to write elf notes");
>               return;
>           }
>       }
> @@ -325,7 +329,7 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
>       CPU_FOREACH(cpu) {
>           ret = cpu_write_elf32_qemunote(f, cpu, s);
>           if (ret < 0) {
> -            error_setg(errp, "dump: failed to write CPU status");
> +            error_setg_errno(errp, errno, "dump: failed to write CPU status");
>               return;
>           }
>       }
> @@ -355,7 +359,8 @@ static void write_elf_section(DumpState *s, int type, Error **errp)
>
>       ret = fd_write_vmcore(&shdr, shdr_size, s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write section header table");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to write section header table");
>       }
>   }
>
> @@ -365,7 +370,7 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)
>
>       ret = fd_write_vmcore(buf, length, s);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to save memory");
> +        error_setg_errno(errp, errno, "dump: failed to save memory");
>       } else {
>           s->written_size += length;
>       }
> @@ -839,7 +844,7 @@ static void create_header32(DumpState *s, Error **errp)
>       dh->status = cpu_to_dump32(s, status);
>
>       if (write_buffer(s->fd, 0, dh, size) < 0) {
> -        error_setg(errp, "dump: failed to write disk dump header");
> +        error_setg_errno(errp, errno, "dump: failed to write disk dump header");
>           goto out;
>       }
>
> @@ -870,7 +875,7 @@ static void create_header32(DumpState *s, Error **errp)
>
>       if (write_buffer(s->fd, DISKDUMP_HEADER_BLOCKS *
>                        block_size, kh, size) < 0) {
> -        error_setg(errp, "dump: failed to write kdump sub header");
> +        error_setg_errno(errp, errno, "dump: failed to write kdump sub header");
>           goto out;
>       }
>
> @@ -886,7 +891,7 @@ static void create_header32(DumpState *s, Error **errp)
>       }
>       if (write_buffer(s->fd, offset_note, s->note_buf,
>                        s->note_size) < 0) {
> -        error_setg(errp, "dump: failed to write notes");
> +        error_setg_errno(errp, errno, "dump: failed to write notes");
>           goto out;
>       }
>
> @@ -951,7 +956,7 @@ static void create_header64(DumpState *s, Error **errp)
>       dh->status = cpu_to_dump32(s, status);
>
>       if (write_buffer(s->fd, 0, dh, size) < 0) {
> -        error_setg(errp, "dump: failed to write disk dump header");
> +        error_setg_errno(errp, errno, "dump: failed to write disk dump header");
>           goto out;
>       }
>
> @@ -982,7 +987,7 @@ static void create_header64(DumpState *s, Error **errp)
>
>       if (write_buffer(s->fd, DISKDUMP_HEADER_BLOCKS *
>                        block_size, kh, size) < 0) {
> -        error_setg(errp, "dump: failed to write kdump sub header");
> +        error_setg_errno(errp, errno, "dump: failed to write kdump sub header");
>           goto out;
>       }
>
> @@ -999,7 +1004,7 @@ static void create_header64(DumpState *s, Error **errp)
>
>       if (write_buffer(s->fd, offset_note, s->note_buf,
>                        s->note_size) < 0) {
> -        error_setg(errp, "dump: failed to write notes");
> +        error_setg_errno(errp, errno, "dump: failed to write notes");
>           goto out;
>       }
>
> @@ -1183,7 +1188,7 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
>       while (get_next_page(&block_iter, &pfn, NULL, s)) {
>           ret = set_dump_bitmap(last_pfn, pfn, true, dump_bitmap_buf, s);
>           if (ret < 0) {
> -            error_setg(errp, "dump: failed to set dump_bitmap");
> +            error_setg_errno(errp, errno, "dump: failed to set dump_bitmap");
>               goto out;
>           }
>
> @@ -1200,7 +1205,7 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
>           ret = set_dump_bitmap(last_pfn, last_pfn + bits_per_buf, false,
>                                 dump_bitmap_buf, s);
>           if (ret < 0) {
> -            error_setg(errp, "dump: failed to sync dump_bitmap");
> +            error_setg_errno(errp, errno, "dump: failed to sync dump_bitmap");
>               goto out;
>           }
>       }
> @@ -1333,7 +1338,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
>       ret = write_cache(&page_data, buf, s->dump_info.page_size, false);
>       g_free(buf);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write page data (zero page)");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to write page data (zero page)");
>           goto out;
>       }
>
> @@ -1349,7 +1355,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
>               ret = write_cache(&page_desc, &pd_zero, sizeof(PageDescriptor),
>                                 false);
>               if (ret < 0) {
> -                error_setg(errp, "dump: failed to write page desc");
> +                error_setg_errno(errp, errno,
> +                                 "dump: failed to write page desc");
>                   goto out;
>               }
>           } else {
> @@ -1374,7 +1381,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
>
>                   ret = write_cache(&page_data, buf_out, size_out, false);
>                   if (ret < 0) {
> -                    error_setg(errp, "dump: failed to write page data");
> +                    error_setg_errno(errp, errno,
> +                                     "dump: failed to write page data");
>                       goto out;
>                   }
>   #ifdef CONFIG_LZO
> @@ -1387,7 +1395,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
>
>                   ret = write_cache(&page_data, buf_out, size_out, false);
>                   if (ret < 0) {
> -                    error_setg(errp, "dump: failed to write page data");
> +                    error_setg_errno(errp, errno,
> +                                     "dump: failed to write page data");
>                       goto out;
>                   }
>   #endif
> @@ -1401,7 +1410,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
>
>                   ret = write_cache(&page_data, buf_out, size_out, false);
>                   if (ret < 0) {
> -                    error_setg(errp, "dump: failed to write page data");
> +                    error_setg_errno(errp, errno,
> +                                     "dump: failed to write page data");
>                       goto out;
>                   }
>   #endif
> @@ -1417,7 +1427,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
>                   ret = write_cache(&page_data, buf,
>                                     s->dump_info.page_size, false);
>                   if (ret < 0) {
> -                    error_setg(errp, "dump: failed to write page data");
> +                    error_setg_errno(errp, errno,
> +                                     "dump: failed to write page data");
>                       goto out;
>                   }
>               }
> @@ -1429,7 +1440,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
>
>               ret = write_cache(&page_desc, &pd, sizeof(PageDescriptor), false);
>               if (ret < 0) {
> -                error_setg(errp, "dump: failed to write page desc");
> +                error_setg_errno(errp, errno,
> +                                 "dump: failed to write page desc");
>                   goto out;
>               }
>           }
> @@ -1438,12 +1450,14 @@ static void write_dump_pages(DumpState *s, Error **errp)
>
>       ret = write_cache(&page_desc, NULL, 0, true);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to sync cache for page_desc");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to sync cache for page_desc");
>           goto out;
>       }
>       ret = write_cache(&page_data, NULL, 0, true);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to sync cache for page_data");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to sync cache for page_data");
>           goto out;
>       }
>
> @@ -1487,7 +1501,8 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
>
>       ret = write_start_flat_header(s->fd);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write start flat header");
> +        error_setg_errno(errp, errno,
> +                         "dump: failed to write start flat header");
>           return;
>       }
>
> @@ -1511,7 +1526,7 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)
>
>       ret = write_end_flat_header(s->fd);
>       if (ret < 0) {
> -        error_setg(errp, "dump: failed to write end flat header");
> +        error_setg_errno(errp, errno, "dump: failed to write end flat header");
>           return;
>       }
>   }


--------------39F47AB03172B8768229509C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="+1">Laurent,<br>
      <br>
      There is already a v3 version of Yasmin's patch that was approved
      and<br>
      it is supposedly waiting to be merged:<br>
      <br>
      <a class="moz-txt-link-freetext" href="http://lists.gnu.org/archive/html/qemu-devel/2018-02/msg03035.html">http://lists.gnu.org/archive/html/qemu-devel/2018-02/msg03035.html</a><br>
      <br>
      <br>
      In a quick look at this patch looks like they do the same thing.<br>
      <br>
      <br>
      Daniel <br>
    </font><br>
    <div class="moz-cite-prefix">On 03/21/2018 09:08 AM, Laurent Vivier
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20180321120853.14293-1-lvivier@redhat.com">
      <pre wrap="">Use error_setg_errno() to display the reason why data write
has failed. For instance, instead of a laconic

  dump: failed to write elf header
or
  dump: failed to save memory

we have now:

  dump: failed to write elf header: No space left on device
or
  dump: failed to save memory: No space left on device

CC: Yasmin Beatriz <a class="moz-txt-link-rfc2396E" href="mailto:yasmins@linux.vnet.ibm.com">&lt;yasmins@linux.vnet.ibm.com&gt;</a>
CC: Jose Ricardo Ziviani <a class="moz-txt-link-rfc2396E" href="mailto:joserz@linux.vnet.ibm.com">&lt;joserz@linux.vnet.ibm.com&gt;</a>
Suggested-by: Eric Blake <a class="moz-txt-link-rfc2396E" href="mailto:eblake@redhat.com">&lt;eblake@redhat.com&gt;</a>
Signed-off-by: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>
---
 dump.c | 79 +++++++++++++++++++++++++++++++++++++++---------------------------
 1 file changed, 47 insertions(+), 32 deletions(-)

diff --git a/dump.c b/dump.c
index 6bdb0dbe23..d04e3f56b0 100644
--- a/dump.c
+++ b/dump.c
@@ -140,7 +140,7 @@ static void write_elf64_header(DumpState *s, Error **errp)

     ret = fd_write_vmcore(&amp;elf_header, sizeof(elf_header), s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write elf header");
+        error_setg_errno(errp, errno, "dump: failed to write elf header");
     }
 }

@@ -171,7 +171,7 @@ static void write_elf32_header(DumpState *s, Error **errp)

     ret = fd_write_vmcore(&amp;elf_header, sizeof(elf_header), s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write elf header");
+        error_setg_errno(errp, errno, "dump: failed to write elf header");
     }
 }

@@ -194,7 +194,8 @@ static void write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,

     ret = fd_write_vmcore(&amp;phdr, sizeof(Elf64_Phdr), s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }

@@ -217,7 +218,8 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,

     ret = fd_write_vmcore(&amp;phdr, sizeof(Elf32_Phdr), s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }

@@ -237,7 +239,8 @@ static void write_elf64_note(DumpState *s, Error **errp)

     ret = fd_write_vmcore(&amp;phdr, sizeof(Elf64_Phdr), s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }

@@ -254,7 +257,7 @@ static void write_guest_note(WriteCoreDumpFunction f, DumpState *s,
     if (s-&gt;guest_note) {
         ret = f(s-&gt;guest_note, s-&gt;guest_note_size, s);
         if (ret &lt; 0) {
-            error_setg(errp, "dump: failed to write guest note");
+            error_setg_errno(errp, errno, "dump: failed to write guest note");
         }
     }
 }
@@ -270,7 +273,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
         id = cpu_index(cpu);
         ret = cpu_write_elf64_note(f, cpu, id, s);
         if (ret &lt; 0) {
-            error_setg(errp, "dump: failed to write elf notes");
+            error_setg_errno(errp, errno, "dump: failed to write elf notes");
             return;
         }
     }
@@ -278,7 +281,7 @@ static void write_elf64_notes(WriteCoreDumpFunction f, DumpState *s,
     CPU_FOREACH(cpu) {
         ret = cpu_write_elf64_qemunote(f, cpu, s);
         if (ret &lt; 0) {
-            error_setg(errp, "dump: failed to write CPU status");
+            error_setg_errno(errp, errno, "dump: failed to write CPU status");
             return;
         }
     }
@@ -302,7 +305,8 @@ static void write_elf32_note(DumpState *s, Error **errp)

     ret = fd_write_vmcore(&amp;phdr, sizeof(Elf32_Phdr), s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write program header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write program header table");
     }
 }

@@ -317,7 +321,7 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
         id = cpu_index(cpu);
         ret = cpu_write_elf32_note(f, cpu, id, s);
         if (ret &lt; 0) {
-            error_setg(errp, "dump: failed to write elf notes");
+            error_setg_errno(errp, errno, "dump: failed to write elf notes");
             return;
         }
     }
@@ -325,7 +329,7 @@ static void write_elf32_notes(WriteCoreDumpFunction f, DumpState *s,
     CPU_FOREACH(cpu) {
         ret = cpu_write_elf32_qemunote(f, cpu, s);
         if (ret &lt; 0) {
-            error_setg(errp, "dump: failed to write CPU status");
+            error_setg_errno(errp, errno, "dump: failed to write CPU status");
             return;
         }
     }
@@ -355,7 +359,8 @@ static void write_elf_section(DumpState *s, int type, Error **errp)

     ret = fd_write_vmcore(&amp;shdr, shdr_size, s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write section header table");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write section header table");
     }
 }

@@ -365,7 +370,7 @@ static void write_data(DumpState *s, void *buf, int length, Error **errp)

     ret = fd_write_vmcore(buf, length, s);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to save memory");
+        error_setg_errno(errp, errno, "dump: failed to save memory");
     } else {
         s-&gt;written_size += length;
     }
@@ -839,7 +844,7 @@ static void create_header32(DumpState *s, Error **errp)
     dh-&gt;status = cpu_to_dump32(s, status);

     if (write_buffer(s-&gt;fd, 0, dh, size) &lt; 0) {
-        error_setg(errp, "dump: failed to write disk dump header");
+        error_setg_errno(errp, errno, "dump: failed to write disk dump header");
         goto out;
     }

@@ -870,7 +875,7 @@ static void create_header32(DumpState *s, Error **errp)

     if (write_buffer(s-&gt;fd, DISKDUMP_HEADER_BLOCKS *
                      block_size, kh, size) &lt; 0) {
-        error_setg(errp, "dump: failed to write kdump sub header");
+        error_setg_errno(errp, errno, "dump: failed to write kdump sub header");
         goto out;
     }

@@ -886,7 +891,7 @@ static void create_header32(DumpState *s, Error **errp)
     }
     if (write_buffer(s-&gt;fd, offset_note, s-&gt;note_buf,
                      s-&gt;note_size) &lt; 0) {
-        error_setg(errp, "dump: failed to write notes");
+        error_setg_errno(errp, errno, "dump: failed to write notes");
         goto out;
     }

@@ -951,7 +956,7 @@ static void create_header64(DumpState *s, Error **errp)
     dh-&gt;status = cpu_to_dump32(s, status);

     if (write_buffer(s-&gt;fd, 0, dh, size) &lt; 0) {
-        error_setg(errp, "dump: failed to write disk dump header");
+        error_setg_errno(errp, errno, "dump: failed to write disk dump header");
         goto out;
     }

@@ -982,7 +987,7 @@ static void create_header64(DumpState *s, Error **errp)

     if (write_buffer(s-&gt;fd, DISKDUMP_HEADER_BLOCKS *
                      block_size, kh, size) &lt; 0) {
-        error_setg(errp, "dump: failed to write kdump sub header");
+        error_setg_errno(errp, errno, "dump: failed to write kdump sub header");
         goto out;
     }

@@ -999,7 +1004,7 @@ static void create_header64(DumpState *s, Error **errp)

     if (write_buffer(s-&gt;fd, offset_note, s-&gt;note_buf,
                      s-&gt;note_size) &lt; 0) {
-        error_setg(errp, "dump: failed to write notes");
+        error_setg_errno(errp, errno, "dump: failed to write notes");
         goto out;
     }

@@ -1183,7 +1188,7 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
     while (get_next_page(&amp;block_iter, &amp;pfn, NULL, s)) {
         ret = set_dump_bitmap(last_pfn, pfn, true, dump_bitmap_buf, s);
         if (ret &lt; 0) {
-            error_setg(errp, "dump: failed to set dump_bitmap");
+            error_setg_errno(errp, errno, "dump: failed to set dump_bitmap");
             goto out;
         }

@@ -1200,7 +1205,7 @@ static void write_dump_bitmap(DumpState *s, Error **errp)
         ret = set_dump_bitmap(last_pfn, last_pfn + bits_per_buf, false,
                               dump_bitmap_buf, s);
         if (ret &lt; 0) {
-            error_setg(errp, "dump: failed to sync dump_bitmap");
+            error_setg_errno(errp, errno, "dump: failed to sync dump_bitmap");
             goto out;
         }
     }
@@ -1333,7 +1338,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
     ret = write_cache(&amp;page_data, buf, s-&gt;dump_info.page_size, false);
     g_free(buf);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write page data (zero page)");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write page data (zero page)");
         goto out;
     }

@@ -1349,7 +1355,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
             ret = write_cache(&amp;page_desc, &amp;pd_zero, sizeof(PageDescriptor),
                               false);
             if (ret &lt; 0) {
-                error_setg(errp, "dump: failed to write page desc");
+                error_setg_errno(errp, errno,
+                                 "dump: failed to write page desc");
                 goto out;
             }
         } else {
@@ -1374,7 +1381,8 @@ static void write_dump_pages(DumpState *s, Error **errp)

                 ret = write_cache(&amp;page_data, buf_out, size_out, false);
                 if (ret &lt; 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
 #ifdef CONFIG_LZO
@@ -1387,7 +1395,8 @@ static void write_dump_pages(DumpState *s, Error **errp)

                 ret = write_cache(&amp;page_data, buf_out, size_out, false);
                 if (ret &lt; 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
 #endif
@@ -1401,7 +1410,8 @@ static void write_dump_pages(DumpState *s, Error **errp)

                 ret = write_cache(&amp;page_data, buf_out, size_out, false);
                 if (ret &lt; 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
 #endif
@@ -1417,7 +1427,8 @@ static void write_dump_pages(DumpState *s, Error **errp)
                 ret = write_cache(&amp;page_data, buf,
                                   s-&gt;dump_info.page_size, false);
                 if (ret &lt; 0) {
-                    error_setg(errp, "dump: failed to write page data");
+                    error_setg_errno(errp, errno,
+                                     "dump: failed to write page data");
                     goto out;
                 }
             }
@@ -1429,7 +1440,8 @@ static void write_dump_pages(DumpState *s, Error **errp)

             ret = write_cache(&amp;page_desc, &amp;pd, sizeof(PageDescriptor), false);
             if (ret &lt; 0) {
-                error_setg(errp, "dump: failed to write page desc");
+                error_setg_errno(errp, errno,
+                                 "dump: failed to write page desc");
                 goto out;
             }
         }
@@ -1438,12 +1450,14 @@ static void write_dump_pages(DumpState *s, Error **errp)

     ret = write_cache(&amp;page_desc, NULL, 0, true);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to sync cache for page_desc");
+        error_setg_errno(errp, errno,
+                         "dump: failed to sync cache for page_desc");
         goto out;
     }
     ret = write_cache(&amp;page_data, NULL, 0, true);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to sync cache for page_data");
+        error_setg_errno(errp, errno,
+                         "dump: failed to sync cache for page_data");
         goto out;
     }

@@ -1487,7 +1501,8 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)

     ret = write_start_flat_header(s-&gt;fd);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write start flat header");
+        error_setg_errno(errp, errno,
+                         "dump: failed to write start flat header");
         return;
     }

@@ -1511,7 +1526,7 @@ static void create_kdump_vmcore(DumpState *s, Error **errp)

     ret = write_end_flat_header(s-&gt;fd);
     if (ret &lt; 0) {
-        error_setg(errp, "dump: failed to write end flat header");
+        error_setg_errno(errp, errno, "dump: failed to write end flat header");
         return;
     }
 }
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------39F47AB03172B8768229509C--


