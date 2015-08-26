Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUdGd-000788-Kh
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 12:09:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUdGb-000746-18
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 12:09:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1ZUdGZ-0000oh-79
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 12:09:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51731)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1ZUdGU-0000nI-5f; Wed, 26 Aug 2015 12:09:30 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 873E68E751;
	Wed, 26 Aug 2015 16:09:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-105.ams2.redhat.com
	[10.36.116.105])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QG9RQf020631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Aug 2015 12:09:28 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E36E1303F90B; Wed, 26 Aug 2015 18:09:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
	<1440587838-25595-8-git-send-email-berrange@redhat.com>
	<87lhcyp89e.fsf@blackfin.pond.sub.org> <55DDB6B1.2060104@redhat.com>
Date: Wed, 26 Aug 2015 18:09:26 +0200
In-Reply-To: <55DDB6B1.2060104@redhat.com> (Eric Blake's message of "Wed, 26
	Aug 2015 06:53:05 -0600")
Message-ID: <87lhcyjakp.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 7/7] maint: avoid useless
	"if (foo) free(foo)" pattern
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
X-List-Received-Date: Wed, 26 Aug 2015 16:09:38 -0000

Eric Blake <eblake@redhat.com> writes:

> On 08/26/2015 06:02 AM, Markus Armbruster wrote:
>> "Daniel P. Berrange" <berrange@redhat.com> writes:
>> 
>>> The free() and g_free() functions both happily accept
>>> NULL on any platform QEMU builds on.
>> 
>> Do systems where free(NULL) doesn't work even exist?  Even C89
>> guarantees it does nothing.
>
> Solaris 4 was the last (pre-C89) system I am aware of that didn't like
> free(NULL).  Ancient history nowadays.
>
>> 
>> My Coccinelle semantic patch finds a few more, because it also fixes up
>> the equally pointless conditional
>> 
>>     if (foo) {
>>         free(foo);
>>         foo = NULL;
>>     }
>
> The assignment to foo is not pointless, but removing the conditional is
> indeed nice.  gnulib's perl script is a lot weaker than coccinelle,
> obviously :)

I only called the conditional pointless :)

>> 
>> @@
>> expression E;
>> @@
>> -	if (E != NULL) {
>> -	    g_free(E);
>> -           E = NULL;
>> -	}
>> +       g_free(E);
>> +       E = NULL;
>
> This only checks for g_free() before assignment to NULL; are there any
> uses of raw free() that do the same?

Running Coccinelle again...  wait...  wait...  yes, but only in
libdecnumber/, which we stole from GCC.  Not sure we want to mess with
it.  Patch appended anyway.

>> Result (feel free to squash it into your patch):
>> 
>
> Whether squashed in or separate, these additional changes and the
> original patch are:
> Reviewed-by: Eric Blake <eblake@redhat.com>

diff --git a/libdecnumber/decNumber.c b/libdecnumber/decNumber.c
index 58211e7..c5b5f66 100644
--- a/libdecnumber/decNumber.c
+++ b/libdecnumber/decNumber.c
@@ -779,7 +779,7 @@ decNumber * decNumberFromString(decNumber *dn, const char chars[],
     /* decNumberShow(dn); */
     } while(0);				/* [for break] */
 
-  if (allocres!=NULL) free(allocres);	/* drop any storage used */
+  free(allocres);	/* drop any storage used */
   if (status!=0) decStatus(dn, status, set);
   return dn;
   } /* decNumberFromString */
@@ -1038,8 +1038,8 @@ decNumber * decNumberCompareTotalMag(decNumber *res, const decNumber *lhs,
     decCompareOp(res, lhs, rhs, set, COMPTOTAL, &status);
     } while(0);				/* end protected */
 
-  if (allocbufa!=NULL) free(allocbufa); /* drop any storage used */
-  if (allocbufb!=NULL) free(allocbufb); /* .. */
+  free(allocbufa); /* drop any storage used */
+  free(allocbufb); /* .. */
   if (status!=0) decStatus(res, status, set);
   return res;
   } /* decNumberCompareTotalMag */
@@ -1142,7 +1142,7 @@ decNumber * decNumberExp(decNumber *res, const decNumber *rhs,
     } while(0);				/* end protected */
 
   #if DECSUBSET
-  if (allocrhs !=NULL) free(allocrhs);	/* drop any storage used */
+  free(allocrhs);	/* drop any storage used */
   #endif
   /* apply significant status */
   if (status!=0) decStatus(res, status, set);
@@ -1237,7 +1237,7 @@ decNumber * decNumberFMA(decNumber *res, const decNumber *lhs,
     decAddOp(res, acc, fhs, set, 0, &status);
     } while(0);				/* end protected */
 
-  if (allocbufa!=NULL) free(allocbufa); /* drop any storage used */
+  free(allocbufa); /* drop any storage used */
   if (status!=0) decStatus(res, status, set);
   #if DECCHECK
   decCheckInexact(res, set);
@@ -1364,7 +1364,7 @@ decNumber * decNumberLn(decNumber *res, const decNumber *rhs,
     } while(0);				/* end protected */
 
   #if DECSUBSET
-  if (allocrhs !=NULL) free(allocrhs);	/* drop any storage used */
+  free(allocrhs);	/* drop any storage used */
   #endif
   /* apply significant status */
   if (status!=0) decStatus(res, status, set);
@@ -1577,10 +1577,10 @@ decNumber * decNumberLog10(decNumber *res, const decNumber *rhs,
     decDivideOp(res, a, b, &aset, DIVIDE, &status); /* into result */
     } while(0);				/* [for break] */
 
-  if (allocbufa!=NULL) free(allocbufa); /* drop any storage used */
-  if (allocbufb!=NULL) free(allocbufb); /* .. */
+  free(allocbufa); /* drop any storage used */
+  free(allocbufb); /* .. */
   #if DECSUBSET
-  if (allocrhs !=NULL) free(allocrhs);	/* .. */
+  free(allocrhs);	/* .. */
   #endif
   /* apply significant status */
   if (status!=0) decStatus(res, status, set);
@@ -2320,11 +2320,11 @@ decNumber * decNumberPower(decNumber *res, const decNumber *lhs,
     #endif
     } while(0);				/* end protected */
 
-  if (allocdac!=NULL) free(allocdac);	/* drop any storage used */
-  if (allocinv!=NULL) free(allocinv);	/* .. */
+  free(allocdac);	/* drop any storage used */
+  free(allocinv);	/* .. */
   #if DECSUBSET
-  if (alloclhs!=NULL) free(alloclhs);	/* .. */
-  if (allocrhs!=NULL) free(allocrhs);	/* .. */
+  free(alloclhs);	/* .. */
+  free(allocrhs);	/* .. */
   #endif
   if (status!=0) decStatus(res, status, set);
   #if DECCHECK
@@ -2415,7 +2415,7 @@ decNumber * decNumberReduce(decNumber *res, const decNumber *rhs,
     } while(0);				     /* end protected */
 
   #if DECSUBSET
-  if (allocrhs !=NULL) free(allocrhs);	     /* .. */
+  free(allocrhs);	     /* .. */
   #endif
   if (status!=0) decStatus(res, status, set);/* then report status */
   return res;
@@ -3169,11 +3169,11 @@ decNumber * decNumberSquareRoot(decNumber *res, const decNumber *rhs,
     decNumberCopy(res, a);		     /* a is now the result */
     } while(0);				     /* end protected */
 
-  if (allocbuff!=NULL) free(allocbuff);	     /* drop any storage used */
-  if (allocbufa!=NULL) free(allocbufa);	     /* .. */
-  if (allocbufb!=NULL) free(allocbufb);	     /* .. */
+  free(allocbuff);	     /* drop any storage used */
+  free(allocbufa);	     /* .. */
+  free(allocbufb);	     /* .. */
   #if DECSUBSET
-  if (allocrhs !=NULL) free(allocrhs);	     /* .. */
+  free(allocrhs);	     /* .. */
   #endif
   if (status!=0) decStatus(res, status, set);/* then report status */
   #if DECCHECK
@@ -4187,10 +4187,10 @@ static decNumber * decAddOp(decNumber *res, const decNumber *lhs,
       }
     } while(0);				     /* end protected */
 
-  if (allocacc!=NULL) free(allocacc);	     /* drop any storage used */
+  free(allocacc);	     /* drop any storage used */
   #if DECSUBSET
-  if (allocrhs!=NULL) free(allocrhs);	     /* .. */
-  if (alloclhs!=NULL) free(alloclhs);	     /* .. */
+  free(allocrhs);	     /* .. */
+  free(alloclhs);	     /* .. */
   #endif
   return res;
   } /* decAddOp */
@@ -4839,11 +4839,11 @@ static decNumber * decDivideOp(decNumber *res,
     #endif
     } while(0);				     /* end protected */
 
-  if (varalloc!=NULL) free(varalloc);	/* drop any storage used */
-  if (allocacc!=NULL) free(allocacc);	/* .. */
+  free(varalloc);	/* drop any storage used */
+  free(allocacc);	/* .. */
   #if DECSUBSET
-  if (allocrhs!=NULL) free(allocrhs);	/* .. */
-  if (alloclhs!=NULL) free(alloclhs);	/* .. */
+  free(allocrhs);	/* .. */
+  free(alloclhs);	/* .. */
   #endif
   return res;
   } /* decDivideOp */
@@ -5184,14 +5184,14 @@ static decNumber * decMultiplyOp(decNumber *res, const decNumber *lhs,
     decFinish(res, set, &residue, status);   /* final cleanup */
     } while(0);				/* end protected */
 
-  if (allocacc!=NULL) free(allocacc);	/* drop any storage used */
+  free(allocacc);	/* drop any storage used */
   #if DECSUBSET
-  if (allocrhs!=NULL) free(allocrhs);	/* .. */
-  if (alloclhs!=NULL) free(alloclhs);	/* .. */
+  free(allocrhs);	/* .. */
+  free(alloclhs);	/* .. */
   #endif
   #if FASTMUL
-  if (allocrhi!=NULL) free(allocrhi);	/* .. */
-  if (alloclhi!=NULL) free(alloclhi);	/* .. */
+  free(allocrhi);	/* .. */
+  free(alloclhi);	/* .. */
   #endif
   return res;
   } /* decMultiplyOp */
@@ -5540,9 +5540,9 @@ static decNumber *decExpOp(decNumber *res, const decNumber *rhs,
     decFinish(res, set, &residue, status);	 /* cleanup/set flags */
     } while(0);				/* end protected */
 
-  if (allocrhs !=NULL) free(allocrhs);	/* drop any storage used */
-  if (allocbufa!=NULL) free(allocbufa); /* .. */
-  if (allocbuft!=NULL) free(allocbuft); /* .. */
+  free(allocrhs);	/* drop any storage used */
+  free(allocbufa); /* .. */
+  free(allocbuft); /* .. */
   /* [status is handled by caller] */
   return res;
   } /* decExpOp */
@@ -5852,8 +5852,8 @@ static decNumber *decLnOp(decNumber *res, const decNumber *rhs,
     decFinish(res, set, &residue, status);	 /* cleanup/set flags */
     } while(0);				/* end protected */
 
-  if (allocbufa!=NULL) free(allocbufa); /* drop any storage used */
-  if (allocbufb!=NULL) free(allocbufb); /* .. */
+  free(allocbufa); /* drop any storage used */
+  free(allocbufb); /* .. */
   /* [status is handled by caller] */
   return res;
   } /* decLnOp */
@@ -6017,8 +6017,8 @@ static decNumber * decQuantizeOp(decNumber *res, const decNumber *lhs,
     } while(0);				/* end protected */
 
   #if DECSUBSET
-  if (allocrhs!=NULL) free(allocrhs);	/* drop any storage used */
-  if (alloclhs!=NULL) free(alloclhs);	/* .. */
+  free(allocrhs);	/* drop any storage used */
+  free(alloclhs);	/* .. */
   #endif
   return res;
   } /* decQuantizeOp */
@@ -6200,8 +6200,8 @@ static decNumber *decCompareOp(decNumber *res, const decNumber *lhs,
       }
     }
   #if DECSUBSET
-  if (allocrhs!=NULL) free(allocrhs);	/* free any storage used */
-  if (alloclhs!=NULL) free(alloclhs);	/* .. */
+  free(allocrhs);	/* free any storage used */
+  free(alloclhs);	/* .. */
   #endif
   return res;
   } /* decCompareOp */
@@ -6335,7 +6335,7 @@ static Int decUnitCompare(const Unit *a, Int alength,
     result=(*u==0 ? 0 : +1);
     }
   /* clean up and return the result */
-  if (allocacc!=NULL) free(allocacc);	/* drop any storage used */
+  free(allocacc);	/* drop any storage used */
   return result;
   } /* decUnitCompare */
 

